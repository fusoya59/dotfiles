#!/bin/sh

# Function to check if a given tty is running vim/nvim
is_vim() {
    ps -o state= -o comm= -t "$1" | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'
}

# Get the tty of the current pane
current_tty=$(tmux display -p '#{pane_tty}')

# Check if the current pane is running vim/nvim
if is_vim "$current_tty"; then
    # If in an nvim pane, toggle zoom
    tmux resize-pane -Z
else
    # If not in an nvim pane, find one and zoom it
    vim_pane=$(tmux list-panes -F '#{pane_id}' | while read pane_id; do
        pane_tty=$(tmux display -p -t "$pane_id" '#{pane_tty}')
        if is_vim "$pane_tty"; then
            echo "$pane_id"
            break
        fi
    done)
    # If an nvim pane is found, switch to it and zoom
    if [ -n "$vim_pane" ]; then
        tmux select-pane -t "$vim_pane"
        tmux resize-pane -Z
    fi
fi
