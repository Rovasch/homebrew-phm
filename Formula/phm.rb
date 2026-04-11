class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "8a292063ec4354a0108b769f9abf06c78f0149e1fb7438ef79193df2b9862ad6"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "8250fdc6ee229067c2e69350d2bfb54b3017b8729c47f382d64a3bcb096d4b8e"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phm --version")
  end
end
