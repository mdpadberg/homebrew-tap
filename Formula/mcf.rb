
class Mcf < Formula
    version '0.15.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.15.0/mcf-0.15.0-x86_64-apple-darwin.tar.gz"
            sha256 "e4346825b64a12c27c6109c4f19cf7733d4013112366fbf87f81f0abe3c9f162"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.15.0/mcf-0.15.0-aarch64-apple-darwin.tar.gz"
            sha256 "e0b2e6e0ddaad309e83d129417223e4f7de96defa6e1761af4774e801c754e5c"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.15.0/mcf-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "70917c59d171284e36d9c81bf2b3a9f0ed71bb7ff9d94a2d09050b5d606851d2"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.15.0/mcf-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "70917c59d171284e36d9c81bf2b3a9f0ed71bb7ff9d94a2d09050b5d606851d2"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.15.0/mcf-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "70917c59d171284e36d9c81bf2b3a9f0ed71bb7ff9d94a2d09050b5d606851d2"
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

