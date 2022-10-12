
class Ka < Formula
    version '0.7.0'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.0/ka-0.7.0-x86_64-apple-darwin.tar.gz"
            sha256 "4ea611a1f0901f4ef5276b643278bb15f6e32b95b4705acce1e176af046afd6b"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.0/ka-0.7.0-aarch64-apple-darwin.tar.gz"
            sha256 "95d8957e7a4b35a476b2fcd5ac76d602a58774116f7d1c077e239280a9f6d7bb"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.0/ka-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "cfb896a43756564f0af60ece0b25cd3b7588863149b5d21c8f385d864f146677"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.0/ka-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "cfb896a43756564f0af60ece0b25cd3b7588863149b5d21c8f385d864f146677"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.0/ka-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "cfb896a43756564f0af60ece0b25cd3b7588863149b5d21c8f385d864f146677"
        end
    end

    def install
      bin.install "ka"
    end
  end

