class Mcf < Formula
    version '0.7.1'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.1/ka-0.7.1-x86_64-apple-darwin.tar.gz"
            sha256 "b785e9f11773d27a6931e02fc8e8215807fad8300e1d907fc41496b23987a48a"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.1/ka-0.7.1-aarch64-apple-darwin.tar.gz"
            sha256 "bb43c5a1f0173015267af5f35e86fee6c6312cae582d68820bf53aa8c3f53988"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.1/ka-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "e76a899120dd4777dc5082b6606d9942cd3e3bfd936b2e6ed9d4d830092b560d"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.1/ka-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "e76a899120dd4777dc5082b6606d9942cd3e3bfd936b2e6ed9d4d830092b560d"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.7.1/ka-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "e76a899120dd4777dc5082b6606d9942cd3e3bfd936b2e6ed9d4d830092b560d"
        end
    end

    def install
        bin.install "ka"
    end
  end
