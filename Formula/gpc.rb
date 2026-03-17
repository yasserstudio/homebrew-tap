# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "54a016dd2fba8a43bc0c924b2a920bb90d2fc4ba36cb7b7511db53051366e55b"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "82064a5115a4e2cd650d7fa6ef1e0f895f9b0dc8d2ab27169f7060b437123bba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "e3e76ac625416b8b95fe62a8d0e0356ed184ecd8fe0a4b83f14b259b2381c4fa"
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
