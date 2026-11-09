.DEFAULT_GOAL := help

.PHONY: help build publish publish-reset-history preview

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-26s\033[0m %s\n", $$1, $$2}'

build: ## Rebuild the site from a clean _site
	rm -rf -- _site
	quarto render

publish: build ## Rebuild from a clean _site and publish to GitHub Pages
	quarto publish gh-pages --no-render --no-prompt

publish-reset-history: build ## Publish a clean site with a single new gh-pages commit (replaces history)
	bash scripts/publish-reset-history.sh

preview: ## Preview the site locally
	quarto preview
