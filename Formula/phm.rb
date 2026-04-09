class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "91c17f50b5e4e6001d1a87bbc143afac2e773cdb8c08816bdadbc5bfa40687f7"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "baf724d67a1c5be27848bbf496ad61595a3a75dbe393daf503480114530571ee"
  end

  def install
    bin.install "phm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phm --version")
  end
end
