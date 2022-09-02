
class Mcf < Formula
    version 'v0.11.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.11.0/mcf-v0.11.0-x86_64-apple-darwin.tar.gz"
            sha256 "30fc746de1c190ccbc7f353eb2ad608d96640da614c28c74054dcc7406a62fdb"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.11.0/mcf-v0.11.0-aarch64-apple-darwin.tar.gz"
            sha256 "a549a267f7eebd0430b852df6a83521a5640a8c4071af1fadd3e3fa03590baa5"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.11.0/mcf-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0c79e7e715f0d5b4155feb1fe79a4f1fb8947443a1e967c3d1d44b0f20028528"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.11.0/mcf-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0c79e7e715f0d5b4155feb1fe79a4f1fb8947443a1e967c3d1d44b0f20028528"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.11.0/mcf-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0c79e7e715f0d5b4155feb1fe79a4f1fb8947443a1e967c3d1d44b0f20028528"
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

