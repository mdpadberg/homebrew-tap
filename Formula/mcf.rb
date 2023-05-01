class Mcf < Formula
    version '0.16.1'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.1/mcf-0.16.1-x86_64-apple-darwin.tar.gz"
            sha256 "87a32d7433db2be61c665548d3fa1736b20b51c0530a5294e1e8eae41b0ce119"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.1/mcf-0.16.1-aarch64-apple-darwin.tar.gz"
            sha256 "59f13f659456beb26b42b6142b66c5e442128f401f3fbefef831cc69b442c5d7"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.1/mcf-0.16.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "373bea41e2e09356509f9d3479852a59e548ff8b6af6a0ee031a1b9eb4bcaedd"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.1/mcf-0.16.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "373bea41e2e09356509f9d3479852a59e548ff8b6af6a0ee031a1b9eb4bcaedd"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.16.1/mcf-0.16.1-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "373bea41e2e09356509f9d3479852a59e548ff8b6af6a0ee031a1b9eb4bcaedd"
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
