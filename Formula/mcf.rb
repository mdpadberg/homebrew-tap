
class Mcf < Formula
    version '0.12.1'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.12.1/mcf-0.12.1-x86_64-apple-darwin.tar.gz"
            sha256 "ae53e6fb3657f732dc657d164eec7f025cdac758457314775f06c288a0954671"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.12.1/mcf-0.12.1-aarch64-apple-darwin.tar.gz"
            sha256 "357ed9125287ba02616557292891d36b569ecada7bc1f0ef075eb0ef39f37c71"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.12.1/mcf-0.12.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "a827e633427476efc72fa1a39c567282d779aedd93c6bd27ebc4212f6492164b"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.12.1/mcf-0.12.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "a827e633427476efc72fa1a39c567282d779aedd93c6bd27ebc4212f6492164b"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.12.1/mcf-0.12.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "a827e633427476efc72fa1a39c567282d779aedd93c6bd27ebc4212f6492164b"
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

