.PHONY:  install build serve

serve:
		mkdocs serve

install:
		pip install mkdocs
		pip install mkdocs-material
		pip install mkdocs-include-markdown-plugin
		pip install mkdocs-git-revision-date-localized-plugin

build:
		mkdocs build
