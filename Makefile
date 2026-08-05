PACKAGES := vim zsh ripgrep git atuin ghostty helix lazygit starship tmux vscode yazi claude fd harper-ls sesh skillshare

.PHONY: install
install: ## Stow all packages
	@stow -v $(PACKAGES)

.PHONY: uninstall
uninstall: ## Unstow all packages
	@stow -vD $(PACKAGES)

.PHONY: restow
restow: ## Restow (useful after modifying package contents)
	@stow -vR $(PACKAGES)

.PHONY: dry-run
dry-run: ## Preview changes without applying
	@stow -nv $(PACKAGES)

.PHONY: brew
brew: ## Install all Homebrew packages from Brewfile
	@brew bundle install --file=$(HOME)/Brewfile

.PHONY: update
update: ## Pull latest dotfiles and restow
	@git pull --rebase && $(MAKE) restow

.PHONY: help
help:
	@awk -F':.*?## ' '/^[a-zA-Z_-]+:.*?## /{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
