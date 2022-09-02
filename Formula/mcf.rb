
class Mcf < Formula
    version '0.13.1'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.1/mcf-0.13.1-x86_64-apple-darwin.tar.gz"
            sha256 "d285ad7e704309daca4be3b18de5ae26b021eb0b2d34b47bf7998b74ee0d9547"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.1/mcf-0.13.1-aarch64-apple-darwin.tar.gz"
            sha256 "139cefba2f29a4cf14fcf68b2d322047940d37f778fccaa566132f01a113723c"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.1/mcf-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "53197dd4c72b349828ce87e39ebd5295e6bba645c08d53ef14feda9eefa95359"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.1/mcf-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "53197dd4c72b349828ce87e39ebd5295e6bba645c08d53ef14feda9eefa95359"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.1/mcf-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "53197dd4c72b349828ce87e39ebd5295e6bba645c08d53ef14feda9eefa95359"
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

