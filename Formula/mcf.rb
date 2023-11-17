class Mcf < Formula
    version '0.18.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.0/mcf-0.18.0-x86_64-apple-darwin.tar.gz"
            sha256 "d485ea8cc124f68e0dcf6e3428da1e10838f8d4965e1e812b37d1633693ce20a"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.0/mcf-0.18.0-aarch64-apple-darwin.tar.gz"
            sha256 "a50d2d57159a77e27e06cae3ca2f8e6978eb3312c337fd6adeaebdbc86204fcc"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.0/mcf-0.18.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "786bcec7db19b87c55397cd3e05c872d42af20e87b383e7e8292621e8a4911bb"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.0/mcf-0.18.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "786bcec7db19b87c55397cd3e05c872d42af20e87b383e7e8292621e8a4911bb"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.0/mcf-0.18.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "786bcec7db19b87c55397cd3e05c872d42af20e87b383e7e8292621e8a4911bb"
        end
    end

    def install
      bin.install "mcf"

      bash_output = Utils.safe_popen_read(bin/"mcf", "completion", "bash")
      (bash_completion/"mcf").write bash_output

      zsh_output = Utils.safe_popen_read(bin/"mcf", "completion", "zsh")
      (zsh_completion/"_mcf").write zsh_output

      fish_output = Utils.safe_popen_read(bin/"mcf", "completion", "fish")
      (fish_completion/"mcf.fish").write fish_output
    end
  end
