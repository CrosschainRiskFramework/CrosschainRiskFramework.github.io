# Crosschain Risk Framework

The [Crosschain Risk Framework](https://crosschainriskframework.github.io/) website provides a high-level systematic
overview of the security risks in cross-chain protocols by identifying,
classifying, and analyzing the elements of risk inherent in the design,
implementation and operation of such infrastructure. In addition, it
profers a set of risk-controls and best practices to mitigate the
likelihood and magnitude of various risks. This repository holds the source code behind the website.

### Local Build
[MkDocs](https://www.mkdocs.org/) is used to generate the documentation pages from the markdown files in this repository.

#### Prerequisites
- Python 3.x.x

#### Install dependencies
Clone this repo, then `cd` into it and execute:
```
 make install
```

#### Build documentation
To build the documentation using MkDocs, execute the following :
```
make build
```

#### Serve documentation locally
To view the documentation locally using MkDocs execute the command below. This will build and serve the documentation site locally, and automatically update the site if the underlying files are changed .
```
make serve
```
Then, open browser to http://127.0.0.1:8000/

### Remote deployment
The website is automatically updated when new commits are pushed to the `main` branch. More specifically, the documentation site is generated from the updated source code on the `main` branch, and then committed to the `gh-pages` branch using Github actions. The updated files in `gh-pages` are then automatically [deployed](https://crosschainriskframework.github.io/).

*Note: do not edit files in the `gh-pages` branch as these files are overwritten each time a new PR is merged to the `main` branch.*


### How to contribute
See the [Contribution](https://crosschainriskframework.github.io/authors/contributions/)
section of the website.
