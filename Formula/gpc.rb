# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.99"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "a471c3556ae0f04649baa2d87f675ac80fa3b1070c41faedaa2cf29296067d9d"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "838b9cb8666dc3282723ff2c3b32a8fb19f2f46fc28534ad1412e6806e5c9903"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "c3cc9d654d629334082b07789c648fdfb1e4bd562ef3668787aedbbf4689eaa1"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "3b1c611afd6f46f5bba5ec249fa0ada0a8b2596520b5a5cf67eb89fe4e868af2"
    end
  end

  def install
    binary = Dir["gpc-*"].first
    bin.install binary => "gpc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpc --version")
  end
end
