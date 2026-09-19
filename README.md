# homebrew-plan

Homebrew tap for [Plan](https://github.com/zeus-12/plan).

```sh
brew trust --tap zeus-12/plan
brew install --cask zeus-12/plan/plan
```

`brew trust` is a one-time step — Homebrew will not load a third-party tap until you trust it.

The cask strips the macOS quarantine flag after install, so the app opens without the
"unidentified developer" warning. Apple Silicon only.

Upgrades:

```sh
brew upgrade --cask zeus-12/plan/plan
```

`Casks/plan.rb` is updated automatically by the release workflow in the main repo. Don't edit it by hand.
