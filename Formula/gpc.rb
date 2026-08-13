# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.94"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "d9a2fcef2b5c38e3fb30dc93ad4f05d0c8ccb7454badac19e78f7533c4f4674f"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "c5108fc48a7030eb86d413d2a15908d25de07b78576d7c99144e1a512167ad26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "9857f57ebc6e8266130f37c3d998f35fdeede761a3a118c08c2a6461ec856ff0"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "877a199f9389058b4e24104927c35a9fa32c5a5a4acd20c5b4f392944344ff7c"
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
