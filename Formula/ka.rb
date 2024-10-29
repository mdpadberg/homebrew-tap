class Ka < Formula
    version '1.0.1'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.1/ka-1.0.1-x86_64-apple-darwin.tar.gz"
            sha256 "9a4219e1078905b63c7f2c3a0294c7b44356eb79d448f7ad67252d7f7404e571"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.1/ka-1.0.1-aarch64-apple-darwin.tar.gz"
            sha256 "92ff26177e3b251c058fc501d6eb47ef03ba23ca113da976bfde8a7818c43f9c"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.1/ka-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "5a76b2d6bf1f576c8aed62709a3875bb835f7dda111cd9ca39ec62d0219a5241"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.1/ka-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "5a76b2d6bf1f576c8aed62709a3875bb835f7dda111cd9ca39ec62d0219a5241"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.1/ka-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "5a76b2d6bf1f576c8aed62709a3875bb835f7dda111cd9ca39ec62d0219a5241"
        end
    end

    def install
        bin.install "ka"
    end
  end
