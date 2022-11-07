
class Mcf < Formula
    version '0.14.1'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.14.1/mcf-0.14.1-x86_64-apple-darwin.tar.gz"
            sha256 "c85eb59b945cf126fd5ad6bd0b619a78815ef60ee4be84b5f09868475cc3209f"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.14.1/mcf-0.14.1-aarch64-apple-darwin.tar.gz"
            sha256 "eca3690d5bf6019f5f32b7fa62980a09fc10a81e431dc624607f820e2f5c5818"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.14.1/mcf-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d8ca06dd7fcfcb6c0fcf5944308bf3f1d1c2b782fed933376ba25031d37ea818"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.14.1/mcf-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d8ca06dd7fcfcb6c0fcf5944308bf3f1d1c2b782fed933376ba25031d37ea818"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.14.1/mcf-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "d8ca06dd7fcfcb6c0fcf5944308bf3f1d1c2b782fed933376ba25031d37ea818"
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

