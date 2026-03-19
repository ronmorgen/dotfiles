# ================================================================
# fzf.zsh: fzf configuration and key bindings
# ================================================================

# Default command: use fd (respects .gitignore, includes hidden, excludes .git)
export FZF_DEFAULT_COMMAND='fd --type file --hidden --follow --exclude .git'

# Default options: Everforest dark theme
export FZF_DEFAULT_OPTS='
  --height 40%
  --border
  --info=inline
  --layout=reverse
  --color=bg:#2d353b,fg:#d3c6aa,hl:#a7c080
  --color=bg+:#3d4f56,fg+:#d3c6aa,hl+:#a7c080
  --color=info:#dbbc7f,prompt:#7fbbb3,pointer:#d699b6
  --color=marker:#83c092,spinner:#e69875,header:#7fbbb3
'

# Ctrl-T: file search
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='
  --preview "bat --color=always {} 2>/dev/null || cat {}"
  --preview-window=right:50%
'

# Alt-C: directory jumping
export FZF_ALT_C_COMMAND='fd --type directory --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS='
  --preview "tree -C {} 2>/dev/null || ls {}"
'

# Ctrl-R: history search
export FZF_CTRL_R_OPTS='--sort --exact'

# Source fzf key bindings (brew)
[[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Source fzf completions (brew)
[[ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"

# Aliases
alias fzk="ps -ef | fzf | awk '{print \$2}' | xargs kill -9" # fzf kill: kill a process interactively
alias fzb='git checkout $(git branch | fzf)' # fzf branch: switch git branch with fzf
