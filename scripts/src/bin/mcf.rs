use serde::{Serialize, Deserialize};
use std::{error::Error};
use tinytemplate::TinyTemplate;
use reqwest::header::USER_AGENT;
use sha256::digest_bytes;


static TEMPLATE: &str = r#"
class Mcf < Formula
    version '{version}'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "{macos_intel_url}"
            sha256 "{macos_intel_sha256}"
        end
        if Hardware::CPU.arm?
            url "{macos_arm_url}"
            sha256 "{macos_arm_sha256}"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "{linux_arm_url}"
            sha256 "{linux_arm_sha256}"
        end
        if Hardware::CPU.is_64_bit?
            url "{linux_64bit_url}"
            sha256 "{linux_64bit_sha256}"
        end
        if Hardware::CPU.intel?
            url "{linux_intel_url}"
            sha256 "{linux_intel_sha256}"
        end
    end

    def install
      bin.install "mcf"

      bash_output = Utils.safe_popen_read(bin/"mcf", "completion", "bash")
      (bash_completion/"mcf").write bash_output

      zsh_output = Utils.safe_popen_read(bin/"mcf", "completion", "zsh")
      (zsh_completion/"_mcf").write zsh_output

      fish_output = Utils.safe_popen_read(bin/"mcf", "completion", "fish")
      (fish_completion/"mcf.fish").write fish_output
    end
  end
"#;

#[derive(Serialize, Debug)]
struct TemplateData {
    version: String,
    macos_intel_url: String,
    macos_intel_sha256: String,
    macos_arm_url: String,
    macos_arm_sha256: String,
    linux_arm_url: String,
    linux_arm_sha256: String,
    linux_64bit_url: String,
    linux_64bit_sha256: String,
    linux_intel_url: String,
    linux_intel_sha256: String,
}

impl TemplateData {
    pub fn new(version: String) -> TemplateData {
        TemplateData {
            version,
            macos_intel_url: "".to_string(),
            macos_intel_sha256: "".to_string(),
            macos_arm_url: "".to_string(),
            macos_arm_sha256: "".to_string(),
            linux_arm_url: "".to_string(),
            linux_arm_sha256: "".to_string(),
            linux_64bit_url: "".to_string(),
            linux_64bit_sha256: "".to_string(),
            linux_intel_url: "".to_string(),
            linux_intel_sha256: "".to_string(),
        }
    }

    pub fn set_url_based_on_os_and_arch(&mut self, url_of_file: String, sha256_of_file: String) {
        match url_of_file.as_str() {
            _ if url_of_file.as_str().contains("x86_64-apple-darwin.tar.gz") => {
                self.macos_intel_url = url_of_file;
                self.macos_intel_sha256 = sha256_of_file;
            },
            _ if url_of_file.as_str().contains("aarch64-apple-darwin.tar.gz") => {
                self.macos_arm_url = url_of_file;
                self.macos_arm_sha256 = sha256_of_file;
            },
            _ if url_of_file.as_str().contains("x86_64-unknown-linux-gnu.tar.gz") => {
                self.linux_arm_url = url_of_file.clone();
                self.linux_arm_sha256 = sha256_of_file.clone();
                self.linux_64bit_url = url_of_file.clone();
                self.linux_64bit_sha256 = sha256_of_file.clone();
                self.linux_intel_url = url_of_file;
                self.linux_intel_sha256 = sha256_of_file;
            },
            _ if url_of_file.as_str().contains("x86_64-pc-windows-gnu.zip") => {
                // don't do anything, because windows has no brew
            },
            _ => panic!("unkown url_of_file={:#?} sha256_of_file={:#?}", url_of_file, sha256_of_file),
        }
    }
}

#[derive(Deserialize, Serialize, Debug)]
struct GithubApi {
    #[serde(rename = "tag_name")]
    version_number: String,
    assets: Vec<Asset>
}

#[derive(Deserialize, Serialize, Debug)]
struct Asset {
    browser_download_url: String,
}

pub fn main() -> Result<(), Box<dyn Error>> {
    let client = reqwest::blocking::Client::new();
    let response = client
        .get("https://api.github.com/repos/mdpadberg/multi-cf/releases/latest")
        .header(USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36")
        .send()?
        .json::<GithubApi>()?;
    let mut template_date = TemplateData::new(response.version_number);
    for asset in response.assets {
        let asset_as_bytes = client
            .get(&asset.browser_download_url)
            .header(USER_AGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36")
            .send()?
            .bytes()?;
        let sha256_of_asset_file = digest_bytes(&asset_as_bytes);
        template_date.set_url_based_on_os_and_arch(asset.browser_download_url, sha256_of_asset_file);
    }
    let mut tt = TinyTemplate::new();
    tt.add_template("mcf", TEMPLATE)?;
    let rendered = tt.render("mcf", &template_date)?;
    println!("{}", rendered);
    Ok(())
}