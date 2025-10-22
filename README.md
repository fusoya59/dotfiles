# Dotfiles

This repository keeps reproducible `zsh` and `tmux` configuration in source control so a fresh machine can be bootstrapped quickly while keeping secrets out of the repo.

## Layout
- `zsh/` – everything that normally lives in `$HOME` and is loaded by `zsh`, including Powerlevel10k configuration.
- `tmux/` – tmux configuration and helper scripts.

Each directory mirrors its target location underneath `$HOME`, which makes the repo compatible with symlink managers such as GNU stow or chezmoi.

## Usage
```sh
# from the repo root
stow zsh tmux
```
If you prefer manual deployment, copy the files to the corresponding locations under `$HOME`.

## Secrets
Environment variables such as API keys should live in a separate file that remains untracked (for example `~/.config/secrets/zsh.env`) and be sourced from within `.zshrc`. Rotate any tokens that were ever stored directly in this repository.
