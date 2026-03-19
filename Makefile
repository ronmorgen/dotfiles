PACKAGES := vim zsh ripgrep git atuin ghostty helix lazygit starship tmux vscode yazi claude fd

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

.PHONY: help
help:
	@uv run python -c "import re; \
	[[print(f'\033[36m{m[0]:<20}\033[0m {m[1]}') for m in re.findall(r'^([a-zA-Z_-]+):.*?## (.*)$$', open(makefile).read(), re.M)] for makefile in ('$(MAKEFILE_LIST)').strip().split()]"

.DEFAULT_GOAL := help
