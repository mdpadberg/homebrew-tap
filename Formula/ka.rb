
class KeepAwake < Formula
    version '0.5.0'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.5.0/ka-0.5.0-x86_64-apple-darwin.tar.gz"
            sha256 "932f6aca1e4636b944ac0f2ee673b93237b606a2d35d2f7ac6ed7e706cc437b1"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.5.0/ka-0.5.0-aarch64-apple-darwin.tar.gz"
            sha256 "99bd7491dbf1a302667948958072ac18a4a4971e86de0b34679795f4e0d64844"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.5.0/ka-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4784e15361532f541ad26bfd8564fdda52866ab31515fae3b8fdd19f9b7260b4"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.5.0/ka-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4784e15361532f541ad26bfd8564fdda52866ab31515fae3b8fdd19f9b7260b4"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.5.0/ka-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4784e15361532f541ad26bfd8564fdda52866ab31515fae3b8fdd19f9b7260b4"
        end
    end

    def install
      bin.install "ka"
    end
  end

