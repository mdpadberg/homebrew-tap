class Mcf < Formula
    version '0.18.7'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.7/mcf-0.18.7-x86_64-apple-darwin.tar.gz"
            sha256 "e541b41326ba4c5c0ffb5abcbe9ea228946257a5cd06adec060c3ea19912fdaa"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.7/mcf-0.18.7-aarch64-apple-darwin.tar.gz"
            sha256 "c2c6fd2a3adb3f961a7e06ffea5da0d9ff4ec36cf052b606146912c9d8120b6d"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.7/mcf-0.18.7-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56f8d4a28996203d3ff5b56910af49fbd6bc5ee958f30d702b35405720b5c494"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.7/mcf-0.18.7-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56f8d4a28996203d3ff5b56910af49fbd6bc5ee958f30d702b35405720b5c494"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.7/mcf-0.18.7-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "56f8d4a28996203d3ff5b56910af49fbd6bc5ee958f30d702b35405720b5c494"
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
