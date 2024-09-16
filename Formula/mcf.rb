class Mcf < Formula
    version '0.18.11'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.11/mcf-0.18.11-x86_64-apple-darwin.tar.gz"
            sha256 "63980ea3d18be5b01638cf64dcd01045ce5b27570230d0e901eeefb3cb7cf0df"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.11/mcf-0.18.11-aarch64-apple-darwin.tar.gz"
            sha256 "1a2c0bea11896c9a73396cc06f40d69bb3b6b1cfe01ad56593f1083d980ce2ae"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.11/mcf-0.18.11-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b2737d765d3c2dbb3cd6af0debccf316ea1d105a13b366fc56b9ccbbeae45e6b"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.11/mcf-0.18.11-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b2737d765d3c2dbb3cd6af0debccf316ea1d105a13b366fc56b9ccbbeae45e6b"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.11/mcf-0.18.11-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "b2737d765d3c2dbb3cd6af0debccf316ea1d105a13b366fc56b9ccbbeae45e6b"
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
