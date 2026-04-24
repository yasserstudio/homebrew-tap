# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.66"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "fa99d05658b863b5cb2630d4a27935b95adfdd7238be098c0d5cef435f79d150"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "de93dd28a820767e283a1d2c15216d7bc5eeba71e31d3ef538df23d71f416fa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "7aff559ac809fe278d9de0dd21c3f327d956091aa7611acffb8d540f326ef7bf"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "1b5e30e4c5dad9e59745b96c927a93e6c7ce49fa550c811e9ca0219d921c6d1f"
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
