# Introduction
With various layer-one protocols gaining meaningful traction over the last couple of years and layer-two protocols taking [center stage in the scalability roadmap for Ethereum](https://vitalik.ca/general/2021/12/06/endgame.html), it has become clear that the future will be multichain. Emerging trends such as modular blockchains, app chains, and fractal scaling further reinforce this thesis. A multichain world is one in which disparate chains co-exist with thriving ecosystems. In the absence of a countervailing force, the emergence of many different chains leads to fragmentation and the emergence of data and value silos.
 
Cross-chain protocols have emerged as a crucial building block enabling interoperation within a multichain world. They reduce fragmentation, enable scalability, and improve liquidity and market efficiency. In addition, such protocols potentially open up new design spaces for novel cross-chain native applications and use cases.

The growth and adoption of such protocols over the last couple of years have been astounding. The total value locked in token bridges on Ethereum alone, which only paints a partial picture of the adoption of such protocols, reached a high of $27B in 2021. 

The flip side to this rapid growth has been the slew of large-scale hacks observed on such infrastructure. Between 2021 and 2022, more than $2.5B was stolen due to bridge hacks. This is more than two-thirds of all DEFI hacks within that period. In addition, roughly $1B in assets were at risk from vulnerability discovered in such protocols. These hacks also had second-order effects, including extended halts of the underlying chains and regulatory backlash. These events have significantly undermined confidence in cross-chain infrastructure and the multichain future. These events highlight deficiencies in how cross-chain protocols are designed, built and operated today. They also highlight the need for clear models and frameworks for cogently reasoning about the security of cross-chain protocols. 

To this end, this document provides a high-level systematic overview of the security risks in cross-chain protocols by identifying, classifying, and analyzing the risk elements inherent in the design, implementation, and operation of such infrastructure. In addition, it offers a set of risk controls and best practices to mitigate the likelihood and severity of risks. While this document provides a general toolkit for reasoning about cross-chain protocols, it does not directly analyze individual protocols.

The ultimate objective of this document is to enable progress toward more secure, robust, and decentralized cross-chain infrastructures that can serve as solid foundations for a multichain future. 

## Crosschain Communication Protocols

### Modalities
#### Asset Exchange
The change of ownership of an asset in a source network for a corresponding change of ownership in another network. Example: atomic cross-chain swap.
#### Asset Transfer
The movement of an asset from the source ledger to a destination ledger. The transfer would typically lock the asset in the source ledger, and mint a synthetic representation on a target ledger. 
#### General-purpose Messaging
Enables arbitrary data transfer across chain for the purposes of orchestrating cross-chain applications. 

### Layers

### Security Challenges
At its essence, cross-chain communications create dependency relationships between two or more networks. Such dependency relationships typically involve state change in one network driving state change in another. These relationships can be _unidirectional_ or _bidirectional_, _transient_ or _persistent_.  The goal of cross-chain protocols is to enable and guarantee the integrity of these dependencies. To this end, given two networks, a source network and a destination network, where the state in the destination network is dependent on the state in the source network, cross-chain protocols must satisfy the following core properties:

1. only states that are valid in the canonical ledger of the source network are communicated to the destination

1. all relevant state transitions in the source network are relayed to the destination network in a timely manner

1. any invariants that emerge from the cross-chain interactions are always preserved e.g. total supply of wrapped asset in the destination matches supply of underlying native asset in the source.
