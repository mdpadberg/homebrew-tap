class Mcf < Formula
    version '{{version}}'
    desc "Login to multiple cloudfoundry environment."
    homepage "https://github.com/mdpadberg/multi-cf"
  
    on_macos do
        if Hardware::CPU.intel?
            url "{{x86_64appledarwinurl}}"
            sha256 "{{x86_64appledarwinsha256}}"
        end
        if Hardware::CPU.arm?
            url "{{aarch64appledarwinurl}}"
            sha256 "{{aarch64appledarwinsha256}}"
        end
    end
    on_linux do 
        if Hardware::CPU.arm?
            url "{{x86_64unknownlinuxgnuurl}}"
            sha256 "{{x86_64unknownlinuxgnusha256}}"
        end
        if Hardware::CPU.is_64_bit?
            url "{{x86_64unknownlinuxgnuurl}}"
            sha256 "{{x86_64unknownlinuxgnusha256}}"
        end
        if Hardware::CPU.intel?
            url "{{x86_64unknownlinuxgnuurl}}"
            sha256 "{{x86_64unknownlinuxgnusha256}}"
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