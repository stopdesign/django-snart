BASE_DIR = $(CURDIR)

VENV = . $(BASE_DIR)/.venv/bin/activate; \

FMT = printf "\033[34m%-20s\033[0m %s\n"
RGX = /^[0-9a-zA-Z_-]+:.*?\#/

help :: # Show this message
	@awk '{FS=": #"} $(RGX) {$(FMT),$$1,$$2}' $(MAKEFILE_LIST)

clean: # Clean project
	find . -name "*.pyc" -delete
	find . -name "*__pycache__" -delete

count: # Count code lines with cloc
	cloc --vcs git \
		--exclude-dir=migrations,libs,plugins \
		--exclude-lang=SVG,JSON,YAML,Text,make,Markdown,TOML,INI,"PO File" \
		--not-match-f='min.js|min.css|bootstrap|icons.css' \
		--quiet
