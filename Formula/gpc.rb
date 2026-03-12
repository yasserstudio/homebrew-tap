class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.14/gpc-darwin-arm64"
      sha256 "c43e6e973d3d67c11f03d4f52cd41a981c926a6116d5901367101b8c8ce2a525"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.14/gpc-darwin-x64"
      sha256 "eef37e5ece4ce610b50d4e3ca956ce7c5f5f11693ce6c0f5e9f8229c13a96eb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.14/gpc-linux-arm64"
      sha256 "d018e15fa53976fef2f3c189beb8630c0bae03924d7d531cd9f37a728cb14e5c"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.14/gpc-linux-x64"
      sha256 "13835334a3084bb943303c5a293c4ab2b033c64b91ed1206cee7bdabcee272a3"
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
