# Crosschain Risk Framework

This repo holds the source code behind 
https://crosschainriskframework.github.io/ .

The [Crosschain Risk Framework](https://crosschainriskframework.github.io/) website provides a high-level systematic 
overview of the security risks in cross-chain protocols by identifying, 
classifying, and analyzing the elements of risk inherent in the design, 
implementation and operation of such infrastructure. In addition, it 
profers a set of risk-controls and best practices to mitigate the 
likelihood and magnitude of various risks. 


## Authors, How to Contribute, Code of Conduct and CLA
See the [Contribution](https://crosschainriskframework.github.io/authors/contributions/) 
section of the website.



## Building
To build and run the website locally:

* Install python
* Install mkdocs
* Install all of the mkdocs packages in the file ./.github/workflows/main.yml
* Execute ```mkdocs serve```
* Open a web browser to http://127.0.0.1:8000/

The website tracks changes as they are made. 

The deployed website is based on the files on the **main** branch on GitHub. 
The website code is generated using GitHub actions and committed on the 
**gh-pages** branch. Do not edit files in the **gh-pages** branch as 
these files are overwritten each time a new PR is merged to the **main** branch. 


 