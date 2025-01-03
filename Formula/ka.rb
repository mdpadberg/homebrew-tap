class Ka < Formula
    version '1.0.2'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.2/ka-1.0.2-x86_64-apple-darwin.tar.gz"
            sha256 "efe42720447eea8fa47d24688e816c1d1d8259afdf6fbe12473e0073e586162e"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.2/ka-1.0.2-aarch64-apple-darwin.tar.gz"
            sha256 "6ae9fef6ebe13d8545d37cf3ffdfd3d97769050ac1a82417fbbffee1f4e6bf48"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.2/ka-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "7aed9da046e482df9ed519fe4119ff0e77314432274edbaf0af0fc839405a5d0"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.2/ka-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "7aed9da046e482df9ed519fe4119ff0e77314432274edbaf0af0fc839405a5d0"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.2/ka-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "7aed9da046e482df9ed519fe4119ff0e77314432274edbaf0af0fc839405a5d0"
        end
    end

    def install
        bin.install "ka"
    end
  end
