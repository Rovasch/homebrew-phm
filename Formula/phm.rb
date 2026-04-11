class Phm < Formula
  desc "Fast PHP version manager for macOS"
  homepage "https://github.com/Rovasch/phm"
  version "0.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-aarch64-apple-darwin.tar.gz"
    sha256 "0d39ffcb14aa7fcced669fe8cfee4d0590a234c2fc8533a81e335c7cee3fb915"
  end

  on_intel do
    url "https://github.com/Rovasch/phm/releases/download/v#{version}/phm-x86_64-apple-darwin.tar.gz"
    sha256 "9f6e44a60839c0cda8fffb65fa479f950f5cb81b98a205e8f6f248f6bea94c7a"
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
