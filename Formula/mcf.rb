class Mcf < Formula
    version '0.18.17'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.17/mcf-0.18.17-x86_64-apple-darwin.tar.gz"
            sha256 "76005523fb47300e26fa02e04ba84239d142a3389c258e8c56cb361ca24a0a53"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.17/mcf-0.18.17-aarch64-apple-darwin.tar.gz"
            sha256 "3ac283641d361573fab64ae5c41e0f7e5797ee695cf0b9970a274389f05d58e6"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.17/mcf-0.18.17-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b4fc59dde5427bba8e223b2bbd99af6243baf4ff434cf6fe7a1cfee0612c225a"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.17/mcf-0.18.17-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b4fc59dde5427bba8e223b2bbd99af6243baf4ff434cf6fe7a1cfee0612c225a"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.17/mcf-0.18.17-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b4fc59dde5427bba8e223b2bbd99af6243baf4ff434cf6fe7a1cfee0612c225a"
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
