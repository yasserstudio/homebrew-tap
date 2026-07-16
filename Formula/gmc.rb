# typed: false
# frozen_string_literal: true

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the self-contained, prebuilt binary (no Node required) from the
# GitHub release. Auto-bumped on each release by this workflow.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  version "1.0.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-arm64"
      sha256 "6fc8f4961b87d83425a92939b5b4fe3cb718df7b55d21b4c2aa3d64cd93764ca"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-darwin-x64"
      sha256 "10355b9f784b1a0dbf22a5838f9b91a2bf92561c2162a5d1dc3d9f54d12976a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-arm64"
      sha256 "02ef9955006b20a1e3770b5e01e3f0549ad3a8ec627a1bf3aa488f908cc8eff9"
    end
    on_intel do
      url "https://github.com/yasserstudio/gmc/releases/download/v#{version}/gmc-linux-x64"
      sha256 "b047e55c058e9138b87cfe8da640f63c11a9afb36014d911791fa935a7c0d9d1"
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
