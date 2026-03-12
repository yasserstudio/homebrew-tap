class Gpc < Formula
  desc "The complete CLI for Google Play — 187 API endpoints, one tool"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.16/gpc-darwin-arm64"
      sha256 "17794c9b4b085dc456c78af26646b16e4ac221ea1bb1a273f3c8b614e33c8841"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.16/gpc-darwin-x64"
      sha256 "b33153fa80adfc63d69544dc3e02edddeaa3a678245eb98844dc424a01a4077d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.16/gpc-linux-arm64"
      sha256 "6e30620c11955711063a0d6b3fefad472db38dd907dbc540d7d1a751b52fdbb6"
    else
      url "https://github.com/yasserstudio/gpc/releases/download/v0.9.16/gpc-linux-x64"
      sha256 "a8c4aee97cd50e8a2feb4ac8616188ee02f7e019b319a220055eb1b5a83bd449"
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
