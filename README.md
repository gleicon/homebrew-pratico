# Homebrew tap for Pratico

[Pratico](https://github.com/gleicon/pratico) is a local container manager for Apple
silicon Macs: each container in its own VM, behind a Docker-compatible API.

```sh
brew trust gleicon/pratico
brew install --cask gleicon/pratico/pratico
```

Homebrew loads casks only from taps you trust; `brew trust` is needed once.

Requires macOS 26 on Apple silicon. Pratico is not notarized by Apple yet: approve its
first launch once in System Settings › Privacy & Security (**Open Anyway**).

- `brew upgrade --cask pratico` installs a new release.
- `brew uninstall --cask pratico` removes the app and its login job, and keeps your
  containers, images, and volumes in `~/.pratico`.
- `brew uninstall --cask --zap pratico` also deletes `~/.pratico`.

The cask is updated by Pratico's release script from each release's published SHA-256.
