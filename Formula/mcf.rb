class Mcf < Formula
    version '0.10.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.3.0/mcf-v0.3.0-x86_64-apple-darwin.tar.gz"
            sha256 "ad4ab9b1be7c030a8aab7fe85e07ce7990e68ada03f8e929e846199ec758f131"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.3.0/mcf-v0.3.0-x86_64-apple-darwin.tar.gz"
            sha256 "ad4ab9b1be7c030a8aab7fe85e07ce7990e68ada03f8e929e846199ec758f131"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.3.0/mcf-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0d1ece5f1f2e60822f6110045c0821c1af8da0eb64234339f0d8e04030a37263"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.3.0/mcf-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0d1ece5f1f2e60822f6110045c0821c1af8da0eb64234339f0d8e04030a37263"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.3.0/mcf-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "0d1ece5f1f2e60822f6110045c0821c1af8da0eb64234339f0d8e04030a37263"
        end
    end

    def install
      bin.install "mcf"
    end
  end