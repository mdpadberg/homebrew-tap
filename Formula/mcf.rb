
class Mcf < Formula
    version '0.13.2'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.2/mcf-0.13.2-x86_64-apple-darwin.tar.gz"
            sha256 "9f64f03dde5396aee8cfcfac69ca6af9304110381de44ec9e9dd2bfe32d7b5d9"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.2/mcf-0.13.2-aarch64-apple-darwin.tar.gz"
            sha256 "1a9d695a408ee094b6f57ca59c304083d088b60caa3e37d21a97abe19288c674"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.2/mcf-0.13.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "adc3ee8abea6ab754f3c8f64f1d41c0babf5e8ec28bf94b472752fda2516c9b5"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.2/mcf-0.13.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "adc3ee8abea6ab754f3c8f64f1d41c0babf5e8ec28bf94b472752fda2516c9b5"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.13.2/mcf-0.13.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "adc3ee8abea6ab754f3c8f64f1d41c0babf5e8ec28bf94b472752fda2516c9b5"
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

