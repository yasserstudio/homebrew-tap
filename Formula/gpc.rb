class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.21/gpc-darwin-arm64"
      sha256 "5696c405c2622d4011020e3a29300aaf85c62ec2c930fd224fde457adbd378d7"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.21/gpc-darwin-x64"
      sha256 "5faa6d41156e0eff6f81c4e411b19e9d67cc111abdd82202cf23ea1f2dad22fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.21/gpc-linux-arm64"
      sha256 "593f547554dce61b4dd431d04f15b486299def0d9e057aeb16e5afdcf29d0f7f"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.21/gpc-linux-x64"
      sha256 "b03b559d59fd65ac77fa3a3ab22f671fc04b32ee54c5a11b6593170545a37f59"
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
