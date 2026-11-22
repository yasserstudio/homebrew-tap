# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "d4e749c036f2a0c86717d5cb7080e8d6140f423e01aa85ee3e715148b6dbfabe"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "dafaf3cd6c23c5ad01791c2d0a81fe4664d395f2ec183f9ddac189606d3c804c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "b3a7972f786442e6d01a6d920022c891b658ada74b78cf86b367f062b0070c0d"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "fe5b9ac905bc978a768d211379a32d3c0228b3fe745bf805ecf5afcffdebb237"
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
