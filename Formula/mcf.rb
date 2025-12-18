class Mcf < Formula
    version '0.18.16'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.16/mcf-0.18.16-x86_64-apple-darwin.tar.gz"
            sha256 "e5810c1ee06b21fd61aeac370d1a241d9d981fdf8dc56d804a0cbfcdddf31753"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.16/mcf-0.18.16-aarch64-apple-darwin.tar.gz"
            sha256 "b43b9404bffff3dcda48f1a833fea65ba7b12e14c1ef8f68a3bf801581a99d25"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.16/mcf-0.18.16-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "9532ef0b8045e1f45ae3c7e053ecf3996ab08496e5cf5d9c3ac34de75eadd82b"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.16/mcf-0.18.16-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "9532ef0b8045e1f45ae3c7e053ecf3996ab08496e5cf5d9c3ac34de75eadd82b"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.16/mcf-0.18.16-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "9532ef0b8045e1f45ae3c7e053ecf3996ab08496e5cf5d9c3ac34de75eadd82b"
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
