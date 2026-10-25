# Dotfiles

Configuration files for the tools I use on macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a Stow package that mirrors the layout of `$HOME`.

## Packages

| Package | Contents |
|---|---|
| `aerospace` | AeroSpace window manager |
| `bash_aliases` | Shell aliases |
| `bashrc` | `.bashrc` and `.bash_profile` |
| `bat` | bat config and Catppuccin theme |
| `btop` | btop config |
| `ghostty` | Ghostty terminal |
| `git` | Shared Git settings in `~/.config/git/config` |
| `hushlogin` | Silences the login banner |
| `nvim` | Neovim configuration (lazy.nvim) |
| `starship` | Starship prompt |
| `tmux` | tmux config (TPM plugins) |
| `yazi` | Yazi theme |

`wallpapers` is not a Stow package.

## Installation

1. Install [Homebrew](https://brew.sh), then clone the repository and install the tools:

   ```bash
   git clone https://github.com/codebedouin/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   brew bundle
   ```

2. Link the packages:

   ```bash
   stow aerospace bash_aliases bashrc bat btop ghostty git hushlogin nvim starship tmux yazi
   ```

   To preview the changes first, add `-n -v`. To remove a package, use `stow -D <package>`.

3. Create a machine-local Git config. It is not tracked, so it holds your identity and credential helpers:

   ```ini
   [user]
     name = Your Name
     email = you@example.com
   ```

   Git reads `~/.config/git/config` (this repository) first and `~/.gitconfig` second, so values in `~/.gitconfig` take precedence. Tools such as `gh auth setup-git` write to `~/.gitconfig`, which keeps this repository clean.

4. Install the tmux plugin manager, then press `prefix + I` inside tmux:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

5. Open Neovim and run `:Lazy restore`. Treesitter parsers and LSP tools install on first use. For Copilot inline completion, open a file and run `:LspCopilotSignIn` once.

The shell config loads `nvm`, `fzf`, `starship`, `zoxide` and `direnv` when present. `nvm` is installed separately from the Brewfile.

## Updating

```bash
git pull
brew bundle
```

In Neovim, run `:Lazy restore` after pulling to match the committed `lazy-lock.json`, and `:Lazy clean` to remove plugins that are no longer used.

## License

This repository is licensed under the [MIT License](LICENSE).
