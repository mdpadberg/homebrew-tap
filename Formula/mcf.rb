class Mcf < Formula
    version '0.18.10'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.10/mcf-0.18.10-x86_64-apple-darwin.tar.gz"
            sha256 "8d639998e312fd1c937bd453af960fcd86d231596f8b95a46eecfbf2223acde0"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.10/mcf-0.18.10-aarch64-apple-darwin.tar.gz"
            sha256 "297da7c141a1dbcc93b77075e420055b8ca4625ce3da5d2c60a2d935616965ad"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.10/mcf-0.18.10-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "284d21ab9b3481bb51ecf566407fd58f79fc4861423d0ba2ef36529ae8635363"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.10/mcf-0.18.10-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "284d21ab9b3481bb51ecf566407fd58f79fc4861423d0ba2ef36529ae8635363"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.10/mcf-0.18.10-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "284d21ab9b3481bb51ecf566407fd58f79fc4861423d0ba2ef36529ae8635363"
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
