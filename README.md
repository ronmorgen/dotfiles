# dotfiles

Personal development environment managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Features

- **GNU Stow** symlink management -- one command to install everything
- **XDG Base Directory** compliant (`~/.config/` for all app configs)
- **Everforest dark** theme applied consistently across terminal, editor, and fzf
- **Modular zsh** configuration split into focused files (aliases, functions, git, keybindings, fzf)
- **75+ shell aliases** with inline documentation (inline comments in each `.zsh` file)

## Installation

```bash
brew install stow git
git clone https://github.com/ronmo1/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
```

This symlinks all packages into `~/`.

## Packages

| Package    | What it configures | Key features                                                        |
| ---------- | ------------------ | ------------------------------------------------------------------- |
| `atuin`    | Shell history      | Searchable, synced shell history with SQLite backend                |
| `claude`   | Claude Code CLI    | AI assistant configuration and custom skills                        |
| `fd`       | File finder        | Ignore patterns for fd searches                                     |
| `ghostty`  | Terminal emulator  | Everforest color scheme, font, and key bindings                     |
| `git`      | Git                | Global gitconfig, gitignore, and delta diff pager                   |
| `helix`    | Helix editor       | Language servers, keymaps, Everforest theme                         |
| `lazygit`  | Git TUI            | Custom key bindings and UI preferences                              |
| `ripgrep`  | ripgrep            | Smart-case search, ignore patterns                                  |
| `starship` | Shell prompt       | Minimal prompt with git status, Python venv, and AWS context        |
| `tmux`     | Terminal mux       | Prefix remapping, vim-style pane navigation, plugins                |
| `vim`      | Vim                | Settings, keymaps, and plugin configuration                         |
| `vscode`   | VS Code (macOS)    | Settings, key bindings, and extensions list                         |
| `yazi`     | File manager       | File previews, custom keymaps, Everforest theme                     |
| `zsh`      | Zsh shell          | Aliases, functions, fzf (Everforest, bat previews), git completions |

## Key Shortcuts

| Alias   | Command                             | Description                                    |
| ------- | ----------------------------------- | ---------------------------------------------- |
| `gs`    | `git status`                        | Working tree status                            |
| `glo`   | `git log --pretty=…`                | Compact commit log (custom one-line format)    |
| `gswi`  | interactive                         | Fuzzy-pick a branch to switch to               |
| `gsync` | fetch + rebase + push               | Sync current branch with main                  |
| `gundo` | `git reset --soft HEAD~1`           | Undo last commit, keep changes staged          |
| `gdmer` | --                                  | Delete all locally merged branches             |
| `fzk`   | `ps -ef \| fzf \| kill -9`          | Fuzzy-find and kill a process                  |
| `fzb`   | `git checkout $(git branch \| fzf)` | Fuzzy-pick a git branch                        |
| `mcd`   | `mkdir -p && cd`                    | Create directory and cd into it                |
| `y`     | yazi wrapper                        | File manager that syncs cwd on exit            |
| `brews` | --                                  | List all Homebrew formulae and casks with deps |
| `bup`   | `brew update && upgrade`            | Update Homebrew and all packages               |
| `vrun`  | `source .venv/bin/activate`         | Activate Python venv in current directory      |

## Structure

```console
dotfiles/
├── Makefile              # Install/uninstall/restow targets
├── <package>/
│   ├── .config/<app>/    → ~/.config/<app>/
│   └── .<dotfile>        → ~/.<dotfile>
└── zsh/
    ├── .zshrc               → ~/.zshrc
    ├── .zprofile            → ~/.zprofile
    └── .config/zsh/
        ├── aliases.zsh      # General aliases
        ├── functions.zsh    # Shell functions (mcd, brews, vrun, etc.)
        ├── fzf.zsh          # fzf config and aliases (Everforest, bat previews)
        ├── git.zsh          # 70+ git aliases
        ├── keybindings.zsh  # Key bindings
        └── options.zsh      # Shell options
```

## Customization

**Add a new package:**

```bash
mkdir -p newpkg/.config/newpkg
mv ~/.config/newpkg/config.toml newpkg/.config/newpkg/
# Add "newpkg" to PACKAGES in Makefile
make restow
```

**Machine-specific overrides:** Create `~/.zshrc.local` for settings that should not be version-controlled (work credentials, local PATHs, etc.). It is sourced automatically at the end of `.zshrc`.

**Modify existing configs:** Edit files in place and run `make restow` to refresh symlinks.

## Commands

| Command          | Description                  |
| ---------------- | ---------------------------- |
| `make install`   | Symlink all packages to `~/` |
| `make uninstall` | Remove all symlinks          |
| `make restow`    | Re-symlink after changes     |
| `make dry-run`   | Preview without applying     |
