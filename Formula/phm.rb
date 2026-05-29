class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.2.5"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "dbe609bf03137b7a083ca6b3aa7c1b3c63533fe2e59d607bc69eb808fe3bc7de"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "98efc529469739fa8ba9dd840d0b3802f7b8581d6f803c18f7d1cc4d87e7f4c4"
  end

  def install
    bin.install "phm"
  end

  def caveats
    <<~EOS
      Add the following to your shell config:

      For zsh (~/.zshrc):
        eval "$(phm env --shell zsh --use-on-cd)"

      For bash (~/.bashrc):
        eval "$(phm env --shell bash --use-on-cd)"

      For fish (~/.config/fish/config.fish):
        phm env --shell fish --use-on-cd | source

      For non-interactive shells (agents, CI, IDE terminals):
        phm shim create
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phm --version")
  end
end
