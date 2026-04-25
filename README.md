# Homebrew Tap for mdv

This tap provides [`mdv`](https://github.com/pders01/mdv), a terminal
markdown viewer with vim-style keybindings and an `mdv serve` HTTP mode.

## Installation

```bash
brew install pders01/md/mdv
```

Or, if you'd rather tap once and install by name:

```bash
brew tap pders01/md
brew install mdv
```

## Usage

```bash
# View a single markdown file in the terminal
mdv README.md

# Browse a directory of markdown files in a sidebar tree
mdv ./docs

# Serve a directory over HTTP with the same vim keymap on the web
mdv serve ./docs

# Serve with live reload (page refreshes on every save)
mdv serve ./docs --watch
```

See the [main repository](https://github.com/pders01/mdv) for the
full keybinding reference, themes, and feature list.

## md-server (deprecated)

The previous `md-server` formula is preserved for users upgrading from
older installations, but is marked deprecated and will print a
migration warning. It will receive no further updates.

To migrate:

```bash
brew install pders01/md/mdv
brew uninstall md-server
```

## Updating the formula

When a new `mdv` release is cut on GitHub:

1. Bump `version` in `Formula/mdv.rb` to the released tag (without the `v` prefix).
2. Run `shasum -a 256` against each downloaded release tarball
   (`mdv-darwin-arm64.tar.gz`, `mdv-darwin-x64.tar.gz`,
   `mdv-linux-x64.tar.gz`) and replace the corresponding `sha256` lines.
3. Test locally with `brew install --build-from-source ./Formula/mdv.rb`.
4. Commit and push.

## License

MIT — same as the main project.
