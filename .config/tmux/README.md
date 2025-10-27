# tmux Configuration

This directory mirrors tmux configuration relative to `$HOME`.

## Files
- `.tmux.conf` – main tmux configuration with plugin definitions.
- `.tmux/toggle_vim_zoom.sh` – helper used by the `M-0` keybinding to toggle zoom between panes running Neovim.

## Deployment
```sh
stow tmux
```
or copy the files to `$HOME`. Make sure the helper script stays executable (`chmod +x ~/.tmux/toggle_vim_zoom.sh`).
