require "language/node"

# Homebrew formula for gmc — the Google Merchant Center CLI.
# Installs the published @gmc-cli/cli npm package and links the `gmc` binary
# (Homebrew provides Node). Bump `url` + `sha256` on each release.
class Gmc < Formula
  desc "Typed, CI-friendly CLI for the Google Merchant API, with an offline feed-compliance preflight"
  homepage "https://yasserstudio.github.io/gmc/"
  url "https://registry.npmjs.org/@gmc-cli/cli/-/cli-1.0.0.tgz"
  sha256 "b432fce3ad358e909287948a56f09c7e43f2e88cbef6bf832726c5c669bdc99f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "gmc", shell_output("#{bin}/gmc --help")
    assert_match version.to_s, shell_output("#{bin}/gmc --version")
  end
end
