
class Ka < Formula
    version '0.6.0'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.6.0/ka-0.6.0-x86_64-apple-darwin.tar.gz"
            sha256 "0293cd6df8c04e095798029c8db3fb64803521753c67075acb9908c87ed3400c"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.6.0/ka-0.6.0-aarch64-apple-darwin.tar.gz"
            sha256 "b1765b69fac62038a20e5a952f3e0435535f5d9c81c4514451e0c032f57f15a9"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.6.0/ka-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "793878dc51713350b40b08318ff2d9e6ba2462980ea6ccdf9d9be5afade12def"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.6.0/ka-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "793878dc51713350b40b08318ff2d9e6ba2462980ea6ccdf9d9be5afade12def"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/0.6.0/ka-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "793878dc51713350b40b08318ff2d9e6ba2462980ea6ccdf9d9be5afade12def"
        end
    end

    def install
      bin.install "ka"
    end
  end

