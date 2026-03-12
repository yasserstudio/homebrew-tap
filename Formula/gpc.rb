class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.18/gpc-darwin-arm64"
      sha256 "d7a291f44c9952b6a5b9c7cd5d09152a5d998644236f3de5323121351c34d20d"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.18/gpc-darwin-x64"
      sha256 "78a7e86410f7b77148569f9c7b0132f0280f151b2516969b302dd37c63f3d495"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.18/gpc-linux-arm64"
      sha256 "53aeb241ff5e2e3200adad3932fe62996c180bf113f8f2f5a15329567d4ed365"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.18/gpc-linux-x64"
      sha256 "a311ddea61c755b51e8e83f96c65aa4097d2a6c451c0e52adde2e93bfdb700d2"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "x64"
    if OS.mac?
      bin.install "gpc-darwin-#{cpu}" => "gpc"
    else
      bin.install "gpc-linux-#{cpu}" => "gpc"
    end
  end

  test do
    assert_match "gpc", shell_output("#{bin}/gpc --version")
  end
end
