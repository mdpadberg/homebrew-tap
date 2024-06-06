class Ka < Formula
    version '1.0.0'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.0/ka-1.0.0-x86_64-apple-darwin.tar.gz"
            sha256 "88f4664dd409cdd98aff21cc178253308cf06a39902e4b941b454f6bb045b0bf"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.0/ka-1.0.0-aarch64-apple-darwin.tar.gz"
            sha256 "ed56e2c29a315f1215e624688d4eafc6dad5eab33f283f2815ff4fd5d55d8421"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.0/ka-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "432b5c0d5d187cafaabf1604f6f67d5e6c4a3a0423bad00cee3ad9a90a7b2c37"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.0/ka-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "432b5c0d5d187cafaabf1604f6f67d5e6c4a3a0423bad00cee3ad9a90a7b2c37"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.0/ka-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "432b5c0d5d187cafaabf1604f6f67d5e6c4a3a0423bad00cee3ad9a90a7b2c37"
        end
    end

    def install
        bin.install "ka"
    end
  end
