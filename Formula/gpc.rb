# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "a55ddc29872b71d788cc4521de9b12881b788d2a6c7dbaedc39aa1a5ef7df322"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "e54b90675c5901006ca91f04d90078c63d5ee19074f484a3e0502b63cc482874"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "ef1fec88d7f7843d3bad2d792436869a0e0770527eb35ab8f1ece4ca4a5f8388"
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
