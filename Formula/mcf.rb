class Mcf < Formula
    version '0.18.12'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.12/mcf-0.18.12-x86_64-apple-darwin.tar.gz"
            sha256 "2f11cc5ab7cafaa52c34784b2b621356b8a163af488da8215994546b1389f7e8"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.12/mcf-0.18.12-aarch64-apple-darwin.tar.gz"
            sha256 "2f245f79ead9661efe11c2c6622dd08d16553846a8654b342b36c78397feba19"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.12/mcf-0.18.12-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "21ac69f0874bd6c397bbf527827cc930c57d7cde51500c2ba75a68a337f8a6df"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.12/mcf-0.18.12-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "21ac69f0874bd6c397bbf527827cc930c57d7cde51500c2ba75a68a337f8a6df"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.12/mcf-0.18.12-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "21ac69f0874bd6c397bbf527827cc930c57d7cde51500c2ba75a68a337f8a6df"
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
