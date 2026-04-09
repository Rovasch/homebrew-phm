class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "f6385bc2fb6ce0b067655712122dd00d1ee8dc7c81507f89cf42d1aa20527430"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "cd1ad312d085672fc9d2084a9490c29ba34d5ba53590d458ddae42499d4ce0d6"
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
