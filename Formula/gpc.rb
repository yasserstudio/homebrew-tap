class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.19/gpc-darwin-arm64"
      sha256 "1995deffb54ecb7dc50595dbe91257234e922cd15f328476cfc7e0fea33f0ec6"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.19/gpc-darwin-x64"
      sha256 "fc9b8c479081cc53c1a5a0b9a3288a736aa947a2aa645dbc40bcad17f53c1da0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.19/gpc-linux-arm64"
      sha256 "28b0feab0f59b49c110d3c05a7d6728fd9dc06c14a4075ef0e926a7377c37ce7"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.19/gpc-linux-x64"
      sha256 "e7b0a6d33b8772ec56d83e040b54dd03acf295cf8666acdcea0b2ff2205b3422"
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
