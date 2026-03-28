# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.48"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "de8657cadd8b0205d603fb42ae804a1bd5053f49df5963d17e5f3c4610e6fc93"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "a75ec620368a834845e91a28f6d3b1148f335d7169dfc5918e883927fce0b94e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "970cb09a1c7e525e327b05dea313bae9f963f004bd0f7816dd2084f7aa448f3f"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "a7207d0ed6fe75a04c28912d7894937be0f89439c4f3e6fb90e6ebcf664ddab9"
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
