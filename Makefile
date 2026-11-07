.DEFAULT_GOAL := help

.PHONY: help publish

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-26s\033[0m %s\n", $$1, $$2}'

publish: ## Publish the site to GitHub Pages
	quarto publish gh-pages --no-prompt

preview: ## Preview the site locally
	quarto preview
