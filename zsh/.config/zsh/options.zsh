#!/usr/bin/env zsh

# ================================================================
# Zsh Options
# ================================================================

# ----- General -----
unsetopt BEEP               # Disable terminal bell
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shells
setopt NOMATCH              # Error if glob pattern has no matches

# ----- Directory Navigation -----
setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD           # Push directories onto the stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates onto the stack
setopt PUSHD_SILENT         # Don't print directory stack after pushd/popd

# ----- Globbing -----
setopt EXTENDED_GLOB        # Extended globbing (#, ~, ^)
setopt GLOB_DOTS            # Include dotfiles in globbing

# ----- Completion -----
setopt MENU_COMPLETE        # Insert first match immediately, cycle through on tab

# ----- History -----
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# History behavior
setopt APPEND_HISTORY       # Append to history file rather than overwrite
setopt BANG_HIST            # Treat '!' specially during expansion
setopt EXTENDED_HISTORY     # Write timestamps to history
setopt HIST_VERIFY          # Show command before executing from history
setopt SHARE_HISTORY        # Share history between sessions (implies incremental append)

# History deduplication
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicates first when trimming
setopt HIST_FIND_NO_DUPS        # Don't show duplicates in search
setopt HIST_IGNORE_ALL_DUPS     # Remove older duplicate entries
setopt HIST_IGNORE_DUPS         # Don't record consecutive duplicates
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries to file

# History cleanup
setopt HIST_IGNORE_SPACE    # Don't record commands starting with space
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks before recording
