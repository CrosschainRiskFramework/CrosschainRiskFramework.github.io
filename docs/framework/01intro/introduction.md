# Introduction
With several layer-one protocols gaining meaningful traction over the last couple of years and layer-two protocols taking [center stage in the scalability roadmap for Ethereum](https://vitalik.ca/general/2021/12/06/endgame.html), it is increasingly becoming clear that the future will be multichain. This thesis is further reinforced by emerging patterns such as modular blockchains, application-specific chains, and fractal scaling. A multichain world is one in which disparate chains co-exist with thriving ecosystems. 

In the absence of a countervailing force, the proliferation of chains would naturally lead to increased fragmentation and the siloing of ecosystems. Cross-chain protocols directly address this problem by enabling interoperation across distinct chains. They reduce fragmentation, enable scalability, and improve market efficiency. In addition, such protocols potentially open up new design spaces for novel cross-chain native applications and use cases. Hence, cross-chain protocols have emerged as a crucial building block enabling the multichain future. 

The growth and adoption of such protocols over the last couple of years have been astounding. The total value locked in token bridges on Ethereum alone, which only offers a partial picture of the scale of adoption of such protocols, reached a high of $27B in late 2021, growing more than ten-fold from six months prior. There are currently numerous cross-chain-focused projects and significant venture capital funding backing such efforts.

The flip side to this rapid growth and adoption has been the slew of high-profile hacks and failures of these protocols. Between 2021 and 2022, more than $2.5B was stolen due to bridge hacks. This is more than two-thirds of all DeFI hacks within that period. In addition, roughly $1B was at risk from vulnerabilities discovered in such protocols. The knock-on effects of these failures included extended halts of several underlying chains and notable regulatory scrutiny. Overall, these events have undermined confidence in cross-chain infrastructure and the viability of a multichain future. They have also highlighted shortcomings in how cross-chain protocols are designed, built, and operated today and the need to understand their risks and challenges better.

To this end, this document provides a high-level systematic overview of the security risks in cross-chain protocols by identifying, classifying, and analyzing the risk elements inherent in the design, implementation, and operation of such infrastructure. In addition, it offers a set of risk controls and best practices to mitigate the likelihood and severity of risks. While this document provides a general toolkit for reasoning about cross-chain protocols, it does not directly analyze individual protocols. The ultimate objective of this document is to enable progress toward more secure, robust, and decentralized cross-chain infrastructures that can serve as solid foundations for a multichain future. 

## Types of Cross-chain Interaction
Broadly defined, cross-chain protocols enable the exchange of data and value across chains through one of the following three types of interactions:

-  **Asset Exchange:** The transfer of ownership of an asset in one network for a corresponding change of ownership in another.
- **Asset Transfer:** The movement of the value of an asset from a source ledger to a destination ledger. This typically involves locking an asset in the source ledger and minting a synthetic representation on the destination ledger. 
- **General-purpose Messaging:** The transfer of arbitrary data across chains for the purposes of orchestrating general cross-chain application behaviors. 

## Security Risks
At its essence, cross-chain communication creates a dependency relationship between two or more networks. Such dependency relationships typically involve state change in one network driving state change in another. These relationships can be _unidirectional_ or _bidirectional_, _transient_ or _persistent_. The goal of cross-chain protocols is to enable and guarantee the integrity of these dependencies. Specifically, given two networks, a source, and a destination, where the state in the destination network is dependent on the state in the source network, cross-chain protocols must guarantee the following core security properties:

1. Only states that are valid and final in the source network are communicated to the destination network
1. All relevant state transitions in the source network are relayed to the destination network in a timely manner
1. Any invariants that emerge from the cross-chain interactions are always preserved

This document primarily discusses and assesses the risk of cross-chain protocols by considering factors that affect these core security requirements. 
