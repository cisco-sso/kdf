.DEFAULT_GOAL=help
.PHONY: develop publish publish-push help

develop:  ## Start the development webserver
	@echo "Hugo development server will start"
	@echo "  Access the current website via the URL"
	@echo
	@echo "        http://localhost:1313"
	@echo
	hugo server -D --bind 0.0.0.0 --disableFastRender

build:  ## Build the website to ./public
	./bin/build-to-local-ghpages-branch.sh
	@echo
	@echo "Your website has been generated"
	@echo "  In order to push your changes to the real website"
	@echo
	@echo "        make publish-push"

publish: build  ## Build and push the website to ghpages
	@echo "Pushing your website"
	(cd public && git push origin gh-pages)
	@echo
	@echo "  Your website will be published at in less than a minute"
	@echo
	@echo "        https://kdf.csco.cloud"


help:  ## Print list of Makefile targets
	@# Taken from https://github.com/spf13/hugo/blob/master/Makefile
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	  cut -d ":" -f1- | \
	  awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
