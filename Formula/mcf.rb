class Mcf < Formula
    version '0.18.14'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.14/mcf-0.18.14-x86_64-apple-darwin.tar.gz"
            sha256 "d4d6bea3950433ae4f3e2f660b04b3173015c87539c6acaf4ce9a47c7d03ea9a"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.14/mcf-0.18.14-aarch64-apple-darwin.tar.gz"
            sha256 "2415276576798b058de306ead4cb128edee7a32869872222b8e8b1352d28b9f1"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.14/mcf-0.18.14-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "f8de60d5a1fb9899fcefcf13d1a9bd934e3d790c6f903bf7cc736df94e66c573"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.14/mcf-0.18.14-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "f8de60d5a1fb9899fcefcf13d1a9bd934e3d790c6f903bf7cc736df94e66c573"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.14/mcf-0.18.14-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "f8de60d5a1fb9899fcefcf13d1a9bd934e3d790c6f903bf7cc736df94e66c573"
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
