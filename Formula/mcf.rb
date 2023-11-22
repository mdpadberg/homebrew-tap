class Mcf < Formula
    version '0.18.6'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.6/mcf-0.18.6-x86_64-apple-darwin.tar.gz"
            sha256 "0c489f3e972fd619d7df2c823438a49e96c81eadbbf940e4ab9f17ce8aced3dd"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.6/mcf-0.18.6-aarch64-apple-darwin.tar.gz"
            sha256 "a92165b70d5b8b61385ce42a2ebb95fa66264ac20534554436a931cc87281dd8"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.6/mcf-0.18.6-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "50ebf22f5e0b1c985be488304927a2ef5c9b8b8e8da3c40e724ac5dde31d575b"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.6/mcf-0.18.6-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "50ebf22f5e0b1c985be488304927a2ef5c9b8b8e8da3c40e724ac5dde31d575b"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.6/mcf-0.18.6-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "50ebf22f5e0b1c985be488304927a2ef5c9b8b8e8da3c40e724ac5dde31d575b"
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
