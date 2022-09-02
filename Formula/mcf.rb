
class Mcf < Formula
    version 'v0.5.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.5.0/mcf-v0.5.0-x86_64-apple-darwin.tar.gz"
            sha256 "d9b2f66788cb109759eb90f1c360274dfcd388f9d09913422e66ab2da2d89131"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.5.0/mcf-v0.5.0-aarch64-apple-darwin.tar.gz"
            sha256 "d13fec23a9fdf3a9f41c1e1207ed7135b757f7a6cb20425912aa7eb593bdbcde"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.5.0/mcf-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "ff2e637b994a4c8fcb140ce7283fc215d51e7b6b41cfff6163c9a2c8c3adc88b"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.5.0/mcf-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "ff2e637b994a4c8fcb140ce7283fc215d51e7b6b41cfff6163c9a2c8c3adc88b"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.5.0/mcf-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "ff2e637b994a4c8fcb140ce7283fc215d51e7b6b41cfff6163c9a2c8c3adc88b"
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

