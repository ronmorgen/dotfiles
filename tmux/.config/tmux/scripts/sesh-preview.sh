#!/usr/bin/env sh
# fzf preview for the sesh picker: show the project tree for every entry.
# $1: full fzf line (passed to `sesh preview`, which uses preview_command from sesh.toml)
# $2: entry name without the icon (used to resolve running tmux sessions)

if [ -n "$2" ] && tmux has-session -t "=$2" 2>/dev/null; then
  # sesh previews running sessions as a pane capture; show their tree instead
  dir=$(tmux display-message -p -t "=$2:" '#{session_path}')
  exec eza --tree --level 1 --icons=always --color=always --git-ignore --group-directories-first "$dir"
fi

exec sesh preview "$1"
