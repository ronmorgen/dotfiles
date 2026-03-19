#!/usr/bin/env zsh

bindkey '^[[1;3C' forward-word  # [Option-Right] - move forward one word
bindkey '^[[1;3D' backward-word # [Option-Left] - move backward one word
bindkey "^a" beginning-of-line  # [Ctrl-A] - Beginning of line
bindkey "^e" end-of-line        # [Ctrl-E] - End of line

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume
