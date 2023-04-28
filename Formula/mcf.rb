class Mcf < Formula
    version '0.16.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.0/mcf-0.16.0-x86_64-apple-darwin.tar.gz"
            sha256 "a3619b4453ba4a8a5e272cefc9961d06753401490dd3b092aac2cedb3ca92e17"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.0/mcf-0.16.0-aarch64-apple-darwin.tar.gz"
            sha256 "4148e49e710c83a959d0499b685a4aeeadba3e139a7c28a757bb940d9e936d00"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.0/mcf-0.16.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56070c1bf97a763ac4ba93c480ff21231683a7895b3767819d9bee9ae5cf6270"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.0/mcf-0.16.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56070c1bf97a763ac4ba93c480ff21231683a7895b3767819d9bee9ae5cf6270"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.0/mcf-0.16.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56070c1bf97a763ac4ba93c480ff21231683a7895b3767819d9bee9ae5cf6270"
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
