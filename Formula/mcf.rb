class Mcf < Formula
    version '0.17.0'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.17.0/mcf-0.17.0-x86_64-apple-darwin.tar.gz"
            sha256 "fb27e8774baad96a9c5059bd27021487cac444822b11bfdd4629e796ad510e79"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.17.0/mcf-0.17.0-aarch64-apple-darwin.tar.gz"
            sha256 "3cbfb088b38f026f9d575f41c6aaec55ad3a2763159cb43726cc2b648445d2c9"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.17.0/mcf-0.17.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "87450a3893198db816e81d19d226271bfc36bef89ddd7b3c3ad6cfeada15abb7"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.17.0/mcf-0.17.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "87450a3893198db816e81d19d226271bfc36bef89ddd7b3c3ad6cfeada15abb7"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.17.0/mcf-0.17.0-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "87450a3893198db816e81d19d226271bfc36bef89ddd7b3c3ad6cfeada15abb7"
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
