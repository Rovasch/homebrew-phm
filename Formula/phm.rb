class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "0401569be07c5195c96cf56de144c8018b7aeda31dd5ae5b7c04652d3cb44920"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "97bce3c07a51ab31939cfd041a3760608aeccfefc949de1a359edbf6f8d6f268"
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
