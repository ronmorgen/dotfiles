#!/usr/bin/env zsh
# ================================================================
# .zshrc: Loaded only for interactive shell sessions
# ================================================================

[[ -f "${XDG_CONFIG_HOME}/zsh/functions.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/functions.zsh"
[[ -f "${XDG_CONFIG_HOME}/zsh/aliases.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"
[[ -f "${XDG_CONFIG_HOME}/zsh/git.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/git.zsh"
[[ -f "${XDG_CONFIG_HOME}/zsh/keybindings.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/keybindings.zsh"
[[ -f "${XDG_CONFIG_HOME}/zsh/options.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/options.zsh"
[[ -f "${XDG_CONFIG_HOME}/zsh/fzf.zsh" ]] && source "${XDG_CONFIG_HOME}/zsh/fzf.zsh"
[[ -f "${HOME}/.zshrc.local" ]] && source "${HOME}/.zshrc.local"

# ================================================================
# Misc
# ================================================================

# Tmux
if [ -z "$TMUX" ]; then
  tmux new-session -A -s main
fi

# Atuin
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

# Starship
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-z} zsh)"
fi

# Load and initialise completion system
autoload -Uz compinit zrecompile
compinit -d "$ZSH_COMPDUMP"
zrecompile -p "$ZSH_COMPDUMP"

# Cortex CLI completion (disable via /settings in cortex)
[[ -s ~/.zsh/completions/cortex.zsh ]] && source ~/.zsh/completions/cortex.zsh
