class Mcf < Formula
    version '{{version}}'
    desc "Keep you machine awake."
    homepage "https://github.com/mdpadberg/keep-awake"
  
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
        bin.install "ka"
    end
  end