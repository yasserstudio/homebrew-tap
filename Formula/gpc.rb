class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.20/gpc-darwin-arm64"
      sha256 "ddc0637c1f1b463880549580cfc09276fb9d1f7eb6c866821a0258a98b2e9780"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.20/gpc-darwin-x64"
      sha256 "796190ccbc48d5b65b71128d00f786cf48d8f45e7d527c675270d88f009e4794"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.20/gpc-linux-arm64"
      sha256 "dec0939b2e155c02a4921280b6c2ab706989dfb2996c98a6d216d13421033149"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.20/gpc-linux-x64"
      sha256 "cb7f1aa110a5f993fdee80a1a7d4df1a10b7a0fba391ee563464c83438b694eb"
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
