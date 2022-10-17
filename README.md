# Crosschain Risk Framework

This repo has the source code behind 
https://crosschainriskframework.github.io/ .


To run site locally build:

* Install python
* Install mkdocs
* Install all of the mkdocs packages in the file ./.github/workflows/main.yml
* Execute ```mkdocs serve```
* Open a web browser to http://127.0.0.1:8000/

The website tracks changes as they are made. 

The deployed website is based on the files on the **main** branch. 
The website code is generated using GitHub actions and committed on the 
**gh-pages** branch. Do not edit files in the **gh-pages** branch as 
these files are overwritten each time a new PR is merged to the **main** branch. 


