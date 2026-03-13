class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.22/gpc-darwin-arm64"
      sha256 "688c00181bb68e882c16f35d45fc85ce11555bdaa4cd0726dd2d340617642e21"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.22/gpc-darwin-x64"
      sha256 "df6b8270ac38ba4ba301c9250d8716b3cfd7369ee74c753d19b19146d98e20b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.22/gpc-linux-arm64"
      sha256 "cf78473da8e80503d93e0e361d1d4c44e9e6a8edd390e24f2602177a013e457f"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.22/gpc-linux-x64"
      sha256 "4465fee0295b29941f78efbdec96e2de8b8c365bf33a7efa10545a1a0b644484"
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
