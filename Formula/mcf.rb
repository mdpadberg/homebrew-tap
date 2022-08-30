class Mcf < Formula
    version '0.10.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.1.0/mcf-x86_64-apple-darwin"
            sha256 "76c447aed7376243589dad721eef3907052d1c7ec28e5fc681842292391333f3"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.1.0/mcf-x86_64-apple-darwin"
            sha256 "76c447aed7376243589dad721eef3907052d1c7ec28e5fc681842292391333f3"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.1.0/mcf-x86_64-unknown-linux-gnu"
            sha256 "07a2ad16bf54892b4b15570c6b9daac5973f3ed60ef03e7835abad4ae36ec107"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.1.0/mcf-x86_64-unknown-linux-gnu"
            sha256 "07a2ad16bf54892b4b15570c6b9daac5973f3ed60ef03e7835abad4ae36ec107"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/v0.1.0/mcf-x86_64-unknown-linux-gnu"
            sha256 "07a2ad16bf54892b4b15570c6b9daac5973f3ed60ef03e7835abad4ae36ec107"
        end
    end

    def install
      bin.install "mcf"
    end
  end