class Mcf < Formula
    version '0.18.8'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.8/mcf-0.18.8-x86_64-apple-darwin.tar.gz"
            sha256 "ef98163bcf9998ad8b380317b3903e686b73f3a63042d866a55c1e7a14f7b067"
        end
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.8/mcf-0.18.8-aarch64-apple-darwin.tar.gz"
            sha256 "176290e720feb86e31ec3ad546808f5c948cd893e10e30a8ac02d271102651ed"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.8/mcf-0.18.8-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "992a8f7d4caf134b8e270eecef3be22346753b45e5f233adfe7aa676d1ca3809"
        end
        if Hardware::CPU.is_64_bit?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.8/mcf-0.18.8-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "992a8f7d4caf134b8e270eecef3be22346753b45e5f233adfe7aa676d1ca3809"
        end
        if Hardware::CPU.intel?
            url "https://github.com/mdpadberg/multi-cf/releases/download/0.18.8/mcf-0.18.8-x86_64-unknown-linux-gnu.tar.gz"
            sha256 "992a8f7d4caf134b8e270eecef3be22346753b45e5f233adfe7aa676d1ca3809"
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
