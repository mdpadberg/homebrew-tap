class Ka < Formula
    version '1.0.3'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.3/ka-1.0.3-x86_64-apple-darwin.tar.gz"
            sha256 "22d85d0767966769f9344b051cef3d944deadc512b0ff497303814e82bbd59b6"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.3/ka-1.0.3-aarch64-apple-darwin.tar.gz"
            sha256 "bf46023d4758b711d2d32130682aee9bc67463378fd59c6d0154e77621b00bd2"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.3/ka-1.0.3-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "dfdb988f4fe1022ec346468bd4621935672b130698474c590af38cd8f4f91102"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.3/ka-1.0.3-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "dfdb988f4fe1022ec346468bd4621935672b130698474c590af38cd8f4f91102"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/keep-awake/releases/download/1.0.3/ka-1.0.3-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "dfdb988f4fe1022ec346468bd4621935672b130698474c590af38cd8f4f91102"
        end
    end

    def install
        bin.install "ka"
    end
  end
