# typed: false
# frozen_string_literal: true

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the self-contained, prebuilt binary (no Node required) from the
# GitHub release. Auto-bumped on each release by this workflow.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-arm64"
      sha256 "3221c6e2df02aad268f147a02b25020e17e9251d1845699562f9a8b98f581501"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-x64"
      sha256 "e3ff1a8fde1b8010250dbf3166d6f12b201b49517881fd525abcfe604b7e1241"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-arm64"
      sha256 "248888eb1399ec84317111c716024f94efe16735679f054fa28c71c250b950dc"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-x64"
      sha256 "35257e357d4deeb02bbeab9c71cbeee029a6b595e3f2641116a1cf124311aaa6"
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
