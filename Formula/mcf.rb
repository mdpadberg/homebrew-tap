class Mcf < Formula
    version '0.18.13'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.13/mcf-0.18.13-x86_64-apple-darwin.tar.gz"
            sha256 "760e3853017490e0f344383011c4eb83f3c11fc4875afc50e5674ae3282bb798"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.13/mcf-0.18.13-aarch64-apple-darwin.tar.gz"
            sha256 "c6380842f2cc860af7fb75952e1cc3a88745862963f9f74739850c21a7a215e0"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.13/mcf-0.18.13-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4c088b4572645f73d25b0da285788a860982f23b4e47a9655ede9494abcb864e"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.13/mcf-0.18.13-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4c088b4572645f73d25b0da285788a860982f23b4e47a9655ede9494abcb864e"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.13/mcf-0.18.13-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "4c088b4572645f73d25b0da285788a860982f23b4e47a9655ede9494abcb864e"
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
