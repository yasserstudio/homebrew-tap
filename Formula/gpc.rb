class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.15/gpc-darwin-arm64"
      sha256 "9c988e64696a1dd450339f8ec2dd53abde9294fa311a4bf4aeda5f5405c7db9e"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.15/gpc-darwin-x64"
      sha256 "2bb469da4f01f2e9ecbc227fbd769999d333e93f8595b50e24c903e9fca48a49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.15/gpc-linux-arm64"
      sha256 "20e55f702fef55b87b126230e6459be111f9274cfcce6699fae444aa741c68e4"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.15/gpc-linux-x64"
      sha256 "8879de141c74dbc9aca2ec3d6eee564c108c9a00f24f59c4d09a75382169022c"
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
