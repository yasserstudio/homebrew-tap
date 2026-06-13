# typed: false
# frozen_string_literal: true

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the self-contained, prebuilt binary (no Node required) from the
# GitHub release. Auto-bumped on each release by this workflow.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-arm64"
      sha256 "4c0a024ca23044503ea8988809249da2b700cb600c188fc7626c4bfab8df533d"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-x64"
      sha256 "b4e4c8f4a07c0a529b0a435b12c12e661e30dc2aa77e0e2c677a8d00a5176cc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-arm64"
      sha256 "53678611d8d5f2e9bb6d8104f3e8a8857bb29e3c92585c1769cde1d10ee80e02"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-x64"
      sha256 "c9158918223720eca94dceeadda80adc471b82574c97522293217a6af9122622"
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
