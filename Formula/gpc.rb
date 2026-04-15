# typed: false
# frozen_string_literal: true

class Gpc < Formula
  desc "Ship Android apps from your terminal — Google Play Console CLI"
  homepage "https://github.com/yasserstudio/gpc"
  version "0.9.60"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-arm64"
      sha256 "e9384b4b77c45a5176b52c30a74d64b521bbacf172d2cc7deb114c926848c2bc"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-darwin-x64"
      sha256 "2d6db4445e2082addc94908fc0e0fa85590a620e7e2a000e268e70abc69f6371"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-arm64"
      sha256 "c56c740bfc32a770dd557ec8ffff20ee86832acdcdba2532ca9dc496ed549178"
    end
    on_intel do
      url "https://github.com/yasserstudio/gpc/releases/download/v#{version}/gpc-linux-x64"
      sha256 "7c6575eabb9d41b79f13acc21dc5fb5c35c9fd7b846b7bf0ef5e68a4982fe2d3"
    end
  end

  def install
    binary = Dir["gpc-*"].first
    bin.install binary => "gpc"
    # Bun-compiled binaries in the release assets land as mode 0644 once
    # Homebrew unpacks them, so the exec bit must be set explicitly before
    # anything tries to run `gpc --version` or generate completions.
    chmod 0755, bin/"gpc"

    # Generate shell completions from the just-installed binary so bash, zsh,
    # and fish users get completion on upgrade with no eval step.
    generate_completions_from_executable(bin/"gpc", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpc --version")
    assert_match "complete -F _gpc gpc", shell_output("#{bin}/gpc completion bash")
  end
end
