class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.23/gpc-darwin-arm64"
      sha256 "a3e677f6b31c0cd9642a385a803b8eebaceea2cfb624cfec151cd4320e89069b"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.23/gpc-darwin-x64"
      sha256 "7f233dbfccd6ef193405d72616f122848a9fb5a8194cb23658a5019e89fd9d88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.23/gpc-linux-arm64"
      sha256 "541debc432a55180421b6ba8d9566e6c25b92d806f9ce6dfd71331d0e3ef54b2"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.23/gpc-linux-x64"
      sha256 "76bb1795663bb5682d2ff9a877aa28b7874e190775e781b3efdd63d4779f3f20"
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
