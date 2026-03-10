# homebrew-tap

Homebrew formulae for [GPC](https://github.com/yasserstudio/gpc) — the Google Play Console CLI.

## Install

```bash
brew install yasserstudio/tap/gpc
```

Or tap first, then install:

```bash
brew tap yasserstudio/tap
brew install gpc
```

## Update

```bash
brew upgrade gpc
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `gpc` | Ship Android apps from your terminal — Google Play Console CLI |

## Platforms

| Platform | Architecture | Supported |
|----------|-------------|-----------|
| macOS | Apple Silicon (arm64) | Yes |
| macOS | Intel (x64) | Yes |
| Linux | x64 | Yes |
| Linux | arm64 | Yes |

## How It Works

The formula downloads pre-built standalone binaries from [GPC releases](https://github.com/yasserstudio/gpc/releases). No Node.js required.

Formula updates are triggered automatically when a new GPC release is published.

## Links

- [GPC Repository](https://github.com/yasserstudio/gpc)
- [Documentation](https://yasserstudio.github.io/gpc/)
- [npm Package](https://www.npmjs.com/package/@gpc-cli/cli)

## License

MIT
