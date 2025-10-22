# zsh Configuration

This directory mirrors the files that live in the top level of `$HOME` and are read by `zsh`.

## Files
- `.zshrc` – main shell configuration; source an ignored secrets file for tokens.
- `.zshenv` – minimal environment setup that runs for every `zsh` invocation.
- `.zshrc.pre-oh-my-zsh` and `.shell.pre-oh-my-zsh` – bootstrap files created by Oh My Zsh.
- `.p10k.zsh` – Powerlevel10k prompt definition.

## Deployment
```sh
stow zsh
```
or copy the files to `$HOME`.

## Secrets
Keep API keys and other sensitive exports in a separate, ignored file (e.g. `~/.config/secrets/zsh.env`) and source it from `.zshrc`.
