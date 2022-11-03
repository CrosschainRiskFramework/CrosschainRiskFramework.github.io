# Crosschain Risk Framework

The [Crosschain Risk Framework](https://crosschainriskframework.github.io/) website provides a high-level systematic
overview of the security risks in cross-chain protocols by identifying,
classifying, and analyzing the elements of risk inherent in the design,
implementation and operation of such infrastructure. In addition, it
profers a set of risk-controls and best practices to mitigate the
likelihood and magnitude of various risks.

This repo holds the source code behind the website
https://crosschainriskframework.github.io/ . The deployed website is based on the files on the `main` branch in this repository. The website code is generated using GitHub actions and committed on the `gh-pages` branch. Do not edit files in the `gh-pages` branch as
these files are overwritten each time a new PR is merged to the `main` branch.


### Build
#### Install dependencies
- prerequisites: Python 3.x.x
- run `make install`

#### Build Documentation
- run `make build`

#### Serve Documentation Locally
To view the documentation locally execute the command below. This will build and serve the documentation site locally, and automatically update the site if the underlying files are changed.
- run `make serve`
- open browser to http://127.0.0.1:8000/

### How to Contribute
See the [Contribution](https://crosschainriskframework.github.io/authors/contributions/)
section of the website.
