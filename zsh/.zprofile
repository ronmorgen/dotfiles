#!/usr/bin/env zsh

# ================================================================
# .zprofile: Loaded for login shells (both interactive and the rare non-interactive sessions)
# ================================================================

# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
test "$XDG_BIN_HOME" || export XDG_BIN_HOME="${HOME}/.local/bin"
test "$XDG_CACHE_HOME" || export XDG_CACHE_HOME="${HOME}/.cache"
test "$XDG_CONFIG_HOME" || export XDG_CONFIG_HOME="${HOME}/.config"
test "$XDG_DATA_HOME" || export XDG_DATA_HOME="${HOME}/.local/share"
test "$XDG_LIB_HOME" || export XDG_LIB_HOME="${HOME}/.local/lib"
test "$XDG_RUNTIME_HOME" || export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:="/tmp"}"
test "$XDG_STATE_HOME" || export XDG_STATE_HOME="${HOME}/.local/state"

# zsh configuration
test "$ZSH_COMPDUMP" || export ZSH_COMPDUMP="${XDG_CONFIG_HOME}/zsh/.zcompdump"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
fpath=(
  "${XDG_CONFIG_HOME}/zsh/completions"
  $fpath
)
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $HOME/.local/bin
  $path
)
export PATH

# Editors
export EDITOR="hx"
export VISUAL="code"

# Less / Pager / Man
[ -n "$LESSPIPE" ] && export LESSOPEN="| ${LESSPIPE} %s"
LESS_OPTIONS=(
  --quit-if-one-screen
  --no-init
  --ignore-case
  --status-column
  --LONG-PROMPT
  --RAW-CONTROL-CHARS
  --HILITE-UNREAD
  --tabs=4
  --window=-4
)
export LESS="${LESS_OPTIONS[*]}"
export LESSHISTFILE="-"                # Disable the history file to not leave a trail of previously viewed files on the system
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export PAGER='less'
export MANPAGER="${PAGER}"

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Terminal
export TERM="xterm-256color"
export COLORTERM="truecolor"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_INSTALL_BADGE='☕'
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BUNDLE_FILE="${HOME}/Brewfile"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --require-sha"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Rust

# Ripgrep
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

# Starship
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"

# Tmux
TMUX_PROGRAM="$(command -v tmux)"
export TMUX_PROGRAM
export TMUX_CONF="${XDG_CONFIG_HOME}/tmux/tmux.conf"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH
