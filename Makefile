.PHONY: install backup restore

.DEFAULT_GOAL:=help


help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


install: ## Install mackup
	brew install mackup

backup: ## Backup listed dotfiles
	@echo "Making a dry run..."
	mackup backup --dry-run
	@echo "Wait for 5 secs..."
	mackup backup

restore: ## Restore dotfiles from this dir
	mackup restore


