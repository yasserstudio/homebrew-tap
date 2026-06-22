# typed: false
# frozen_string_literal: true

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the self-contained, prebuilt binary (no Node required) from the
# GitHub release. Auto-bumped on each release by this workflow.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  version "1.0.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-arm64"
      sha256 "839854cddecda89213137a6762f43a6a735bc4e188298ea80643de7fa6cc9d71"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-x64"
      sha256 "21ff63e4f4c5b7a9ab8f9b980e422e671bb4f88a888a3611a2d52114b83c2618"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-arm64"
      sha256 "ee738cd9c923c3ecb022504ab2a91b81b85b612cf4344fd38714f24b505bb8f3"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-x64"
      sha256 "e3a27734dd1354044196b9b5641561405e6ac1b487054a88fc6f15a3c4f8dfd5"
    end
  end

  def install
    binary = Dir["gmc-*"].first
    bin.install binary => "gmc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gmc --version")
  end
end
