# Dotfiles

This repository keeps reproducible configuration for the shell, terminal multiplexer, and Wayland desktop components so a fresh machine can be bootstrapped quickly while keeping secrets out of the repo.

## Layout
- `zsh/` – everything that normally lives in `$HOME` and is loaded by `zsh`, including Powerlevel10k configuration.
- `tmux/` – tmux configuration and helper scripts.
- `hypr/` – Hyprland, hypridle, hyprlock, and hyprpaper configuration for `~/.config/hypr`.
- `kitty/` – Kitty terminal configuration for `~/.config/kitty`, including font and opacity settings.
- `waybar/` – Waybar status bar configuration and Catppuccin styling for `~/.config/waybar`.
- `waypaper/` – Waypaper wallpaper manager configuration for `~/.config/waypaper` (configured to drive hyprpaper).

Each directory mirrors its target location underneath `$HOME`, which makes the repo compatible with symlink managers such as GNU stow or chezmoi.

## Dependencies
The configs assume the following packages and assets are installed:

- Hyprland stack: `hyprland`, `hypridle`, `hyprlock`, `hyprpaper`
- Desktop extras: `waybar`, `waypaper`, `swaync`
- Terminal and fonts: `kitty`, FiraCode Nerd Font
- Launchers and defaults: `rofi`, `nautilus`, `brave-browser`
- System helpers used in keybinds: `pipewire`/`wireplumber` (provides `wpctl`), `playerctl`, `brightnessctl`, `impala`
- Optional tooling: `ddcutil` if you enable the commented dimming block in `hypridle.conf`
- Ensure the wallpapers referenced in `hyprlock.conf` and `hyprpaper.conf` exist under `~/Pictures/` (replace with your own paths if needed).

## Usage
```sh
# from the repo root
stow hypr kitty waybar waypaper zsh tmux
```
If you prefer manual deployment, copy the files to the corresponding locations under `$HOME`.

## Secrets
Environment variables such as API keys should live in a separate file that remains untracked (for example `~/.config/secrets/zsh.env`) and be sourced from within `.zshrc`. Rotate any tokens that were ever stored directly in this repository.
