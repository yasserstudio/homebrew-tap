# typed: false
# frozen_string_literal: true

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the self-contained, prebuilt binary (no Node required) from the GitHub
# release. Auto-bumped on each release by .github/workflows/update-formula.yml.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-arm64"
      sha256 "49639fef2c9493cbe36875c7d0caa6d9949f05e3d7b5a2c6e1eb4024c2cc6c59"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-x64"
      sha256 "9c13567a81153bf577358115af18abb88a56879f40049f4109fdeeaa53a59e80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-arm64"
      sha256 "10b64a4dd752f734f114df1360c216f183692cc2e63f8b03d76d373f07fe53f1"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-x64"
      sha256 "960b5f7f2a76c3aa88aec0bfa4313dd170cc86b26c5892c8ec85e0b61d024b7c"
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
