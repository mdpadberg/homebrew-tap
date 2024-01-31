class Mcf < Formula
    version '0.18.9'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.9/mcf-0.18.9-x86_64-apple-darwin.tar.gz"
            sha256 "9464bd522fd6be66c7dee817c36004e118d26fb67b2404387a429540f97fa604"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.9/mcf-0.18.9-aarch64-apple-darwin.tar.gz"
            sha256 "69a4e19cd53477f7ad8f42c7f181766765e7ea2aa54807d14a5f95488ca4989f"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.9/mcf-0.18.9-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d79d36f4c3c73a5ea2c83dbd973135f68ab019fc4878b1c8fe4337e289c0e347"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.9/mcf-0.18.9-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d79d36f4c3c73a5ea2c83dbd973135f68ab019fc4878b1c8fe4337e289c0e347"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.9/mcf-0.18.9-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d79d36f4c3c73a5ea2c83dbd973135f68ab019fc4878b1c8fe4337e289c0e347"
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
