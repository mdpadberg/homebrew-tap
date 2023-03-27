use reqwest::header::USER_AGENT;
use serde::{Deserialize, Serialize};
use sha256::digest_bytes;
use std::error::Error;
use tera::{Context, Tera};

#[macro_use]
extern crate lazy_static;
lazy_static! {
    pub static ref TEMPLATE: Tera = {
        match Tera::new("templates/*.rb") {
            Ok(t) => t,
            Err(e) => {
                println!("Parsing error(s): {}", e);
                ::std::process::exit(1);
            }
        }
    };
}

#[derive(Deserialize, Serialize, Debug)]
struct GithubApi {
    #[serde(rename = "tag_name")]
    version_number: String,
    assets: Vec<Asset>,
}

#[derive(Deserialize, Serialize, Debug)]
struct Asset {
    #[serde(rename = "browser_download_url")]
    url: String,
}

pub fn main() -> Result<(), Box<dyn Error>> {
    let client = reqwest::blocking::Client::new();
    let response = client
        .get("https://api.github.com/repos/mdpadberg/multi-cf/releases/latest")
        .header(USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36")
        .send()?
        .json::<GithubApi>()?;
    let mut context = Context::new();
    context.insert("version", &response.version_number);
    for asset in response.assets {
        let asset_as_bytes = client
            .get(&asset.url)
            .header(USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36")
            .send()?
            .bytes()?;
        match &asset.url.split("/").last().and_then(|value| Some(value.to_string())) {
            Some(some) => {
                let architecture: String = some.split("-").skip(2).collect::<String>().replace(".tar.gz", "");
                context.insert(format!("{}url", architecture), &asset.url);
                context.insert(format!("{}sha256", architecture), &digest_bytes(&asset_as_bytes));
            },
            None => panic!("unkown url={:#?}", asset.url)
        }
    }
    println!(
        "{}",
        TEMPLATE.render("mcf.rb", &context)?
    );
    Ok(())
}
