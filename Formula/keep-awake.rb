
class KeepAwake < Formula
    version '0.1.2'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.1.2/keep-awake-0.1.2-x86_64-apple-darwin.tar.gz"
            sha256 "d6b196ae9d6412a1a3969adf50ceaecb2ce761563a43dd56d02cc507d1f10b57"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.1.2/keep-awake-0.1.2-aarch64-apple-darwin.tar.gz"
            sha256 "4c1b0fa4dd7d7ca39a877ca94f43f83f64f3675e7b6dc9bc25b6ff45fd9ebff4"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.1.2/keep-awake-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "69b45244f5a335913c51406f927f231113c1a3cc97950ade9a02e5f028933c19"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.1.2/keep-awake-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "69b45244f5a335913c51406f927f231113c1a3cc97950ade9a02e5f028933c19"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.1.2/keep-awake-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "69b45244f5a335913c51406f927f231113c1a3cc97950ade9a02e5f028933c19"
        end
    end

    def install
      bin.install "keep-awake"
    end
  end

