.PHONY:  install build serve

install:
		pip install mkdocs
		pip install mkdocs-material
		pip install mkdocs-include-markdown-plugin
		pip install mkdocs-git-revision-date-localized-plugin
		pip install weasyprint

build:
		mkdocs build

serve:
		mkdocs serve
