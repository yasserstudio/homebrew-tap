class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.17/gpc-darwin-arm64"
      sha256 "1cf7446c8c54756c57a8cf54acb0f0ee192cb0d247b3e4ac06dfcfe294de43da"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.17/gpc-darwin-x64"
      sha256 "7446cb3eebfbdc4e863088793938fc720706a697d6c4b830edc3353c03e6ce8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.17/gpc-linux-arm64"
      sha256 "479fac55f9b137aa8998d6021f066e6cdc3f362c37e8e1108d5f19d25d2c7ba5"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.17/gpc-linux-x64"
      sha256 "ff379dbe8ffbce5c27753515eedde6c10c37a0ce95ed9d7837e1e8b8b3307382"
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
