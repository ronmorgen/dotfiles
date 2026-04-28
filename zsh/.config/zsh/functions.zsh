#!/usr/bin/env zsh

# ================================================================
# General
# ================================================================

function mcd() {
  mkdir -p "$1" && cd "$1" || return
}

# ================================================================
# AWS
# ================================================================
s3ls() {
  local BUCKET="$1"
  local PREFIX="$2"

  aws s3api list-objects-v2 \
    --bucket $BUCKET \
    --prefix $PREFIX \
    --query "Contents[][Key, Size, LastModified]" \
    --output text \
    --no-cli-pager
}

# ================================================================
# Python
# ================================================================
: "${PYTHON_VENV_NAME:=.venv}"

# Activate the Python virtual environment in the current directory.
# Usage: vrun [venv_name]
# If no name is given, uses $PYTHON_VENV_NAME (default: .venv).
function vrun() {
  local name="${1:-$PYTHON_VENV_NAME}"
  local venvpath="./${name}"

  if [[ ! -d "$venvpath" ]]; then
    echo "Error: No such virtual environment directory: $venvpath" >&2
    return 1
  fi

  if [[ ! -f "${venvpath}/bin/activate" ]]; then
    echo "Error: '$venvpath' is not a valid Python virtual environment" >&2
    return 1
  fi

  source "${venvpath}/bin/activate"
}

# ================================================================
# Homebrew
# ================================================================

# List all installed formulae and casks with their dependencies.
function brews() {
  local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
  local casks="$(brew list --cask 2>/dev/null)"

  local blue="$(tput setaf 4)"
  local bold="$(tput bold)"
  local off="$(tput sgr0)"

  echo "${blue}==>${off} ${bold}Formulae${off}"
  echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
  echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}

# ================================================================
# Git
# ================================================================

# Get current branch
function git_current_branch() {
  git rev-parse --abbrev-ref HEAD
}

# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo staging
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done
  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

function git_switch_interactive() {
  local branches branch

  branches=$(git branch --sort=-committerdate --color=always | grep -v '^* ' || true)

  branch=$(
    echo "$branches" |
      fzf --ansi \
        --border \
        --exact \
        --layout reverse \
        --header="Current branch: $(git branch --show-current)" \
        --height=25% \
        --prompt='Switch branch > ' \
        --bind='enter:accept' \
        --pointer='▶' |
      awk '{print $1}'
  )

  [ -z "$branch" ] || git switch $branch --quiet

}

# Delete branch locally and on remote (force delete)
function git_branch_delete() {
  if [[ -z "$1" ]]; then
    echo "Usage: gbd <branch-name> [branch-name...]" >&2
    return 1
  fi

  for branch in "$@"; do
    local remote
    remote=$(git config "branch.$branch.remote" || echo "origin")
    local ref
    ref=$(git config "branch.$branch.merge" || echo "refs/heads/$branch")

    echo "Deleting $branch..."

    # Force delete local branch
    git branch -D "$branch" || true

    # Skip if remote is local
    [[ "$remote" = "." ]] && continue

    # Delete remote tracking branch
    git branch -d -r "$remote/$branch" || continue

    # Delete branch on remote server
    git push "$remote" ":$ref"
  done
}

# Sync current branch with main: fetch, rebase, and force-push.
# Automatically aborts rebase on conflicts for manual resolution.
function git_sync() {
  local main_branch
  main_branch=$(git_main_branch)
  local before after

  # Fetch latest main
  git fetch origin "$main_branch" || {
    echo "Fetch failed."
    return 1
  }

  # Attempt rebase onto main
  before=$(git rev-parse HEAD)
  if ! git rebase "origin/$main_branch"; then
    git rebase --abort
    echo "Rebase failed, please resolve conflicts manually."
    return 1
  fi

  # Check if rebase made changes
  after=$(git rev-parse HEAD)
  if [[ "$before" == "$after" ]]; then
    echo "Already up to date."
    return 0
  fi

  # Push rebased changes
  git push --force-with-lease || {
    echo "Push failed."
    return 1
  }
  echo "Rebased and pushed."
}

# ================================================================
# Yazi
# ================================================================

function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd" || true
  rm -f -- "$tmp"
}
