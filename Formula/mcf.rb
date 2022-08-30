class Mcf < Formula
    version '0.10.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.4.0/mcf-v0.4.0-x86_64-apple-darwin.tar.gz"
            sha256 "f6451fa0230e2c5a3a07b7565d8096590025d7aa5b049023b74333acbeb491db"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.4.0/mcf-v0.4.0-aarch64-apple-darwin.tar.gz"
            sha256 "0e1a0ba4c847b022a6dc6c0a5333f95133c837288d826043010f67bd4c4ac757"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.4.0/mcf-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "061b8d25962db6a8d0017dd90c95f5668c0745384d521c684320c74a3d1edc18"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.4.0/mcf-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "061b8d25962db6a8d0017dd90c95f5668c0745384d521c684320c74a3d1edc18"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.4.0/mcf-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "061b8d25962db6a8d0017dd90c95f5668c0745384d521c684320c74a3d1edc18"
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