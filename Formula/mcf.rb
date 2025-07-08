class Mcf < Formula
    version '0.18.15'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.15/mcf-0.18.15-x86_64-apple-darwin.tar.gz"
            sha256 "782d8f75d1dc97f637fbba70778de7380a7095eced0ebc440ae4a2d0e02ccfcb"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.15/mcf-0.18.15-aarch64-apple-darwin.tar.gz"
            sha256 "6b366bff339751f6f6f53cce228e295c89a7cc60651465726f6bdb72d5423585"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.15/mcf-0.18.15-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b495c21250810a1803f41b30d4d25842a7dd793a060390fc021ce90f5e5bb952"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.15/mcf-0.18.15-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b495c21250810a1803f41b30d4d25842a7dd793a060390fc021ce90f5e5bb952"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.15/mcf-0.18.15-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b495c21250810a1803f41b30d4d25842a7dd793a060390fc021ce90f5e5bb952"
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
