.PHONY:  install build serve

install:
		pip install mkdocs
		pip install mkdocs-material
		pip install mkdocs-include-markdown-plugin
		pip install mkdocs-git-revision-date-localized-plugin
		pip install weasyprint
		pip install mkdocs-with-pdf

build:
		mkdocs build

serve:
		mkdocs serve
