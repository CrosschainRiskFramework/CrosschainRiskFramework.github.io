# Introduction
With several layer-one protocols gaining meaningful traction over the last couple of years and layer-two protocols taking [center stage in the scalability roadmap for Ethereum](https://vitalik.ca/general/2021/12/06/endgame.html), it is increasingly becoming clear that the future will be multichain. This thesis is further reinforced by emerging patterns such as [modular blockchains](https://www.alchemy.com/overviews/modular-vs-monolithic-blockchains), [application-specific chains](https://medium.com/1kxnetwork/application-specific-blockchains-9a36511c832), and [fractal scaling](https://medium.com/starkware/fractal-scaling-from-l2-to-l3-7fe238ecfb4f). A multichain world is one in which disparate chains co-exist as thriving ecosystems. 

In the absence of a countervailing force, the proliferation of chains would naturally lead to increased fragmentation and the siloing of ecosystems. Crosschain protocols directly address this problem by enabling interoperation across distinct chains. They reduce fragmentation, enable scalability, and improve market efficiency. In addition, such protocols potentially open up new design spaces for novel crosschain native applications and use cases. Hence, crosschain protocols have emerged as a crucial building block enabling the multichain future. 

The growth and adoption of such protocols over the last couple of years have been astounding. The total value locked in token bridges on Ethereum alone, which only offers a partial picture of the scale of adoption of such protocols, reached a high of US$27B in late 2021. There are currently numerous crosschain-focused projects and significant venture capital funding backing such efforts.

The flip side to this rapid growth and adoption has been the slew of high-profile hacks and failures of these protocols. Between 2021 and 2022, more than US$2.5B was stolen due to bridge hacks. This is more than two-thirds of all DeFI hacks within that period. In addition, roughly US$1B was at risk from vulnerabilities discovered in such protocols. The knock-on effects of these failures included extended halts of several underlying chains and notable regulatory scrutiny. Overall, these events have undermined confidence in crosschain infrastructure and the viability of a multichain future. They have also highlighted shortcomings in how crosschain protocols are designed, built, and operated today and the need to understand their risks and challenges better.

To this end, this document provides a high-level systematic overview of the security risks in crosschain protocols by identifying, classifying, and analyzing the risk elements inherent in the design, implementation, and operation of such infrastructure. In addition, it offers a set of risk controls and best practices to mitigate the likelihood and severity of risks. While this document provides a general toolkit for reasoning about crosschain protocols, it does not directly analyze individual protocols. The ultimate objective of this document is to enable progress toward more secure, robust, and decentralized crosschain infrastructures that can serve as solid foundations for a multichain future. 

## Types of Crosschain Interaction
Broadly defined, crosschain protocols enable the exchange of data and value across chains through one of the following three types of interactions:

#### Asset Exchange
The transfer of ownership of an asset in one network for a corresponding change of ownership in another.

#### Asset Transfer
The movement of the value of an asset from a source ledger to a destination ledger. This typically involves locking an asset in the source ledger and minting a synthetic representation on the destination ledger. 

#### General-purpose Messaging
The transfer of arbitrary data across chains for the purposes of orchestrating general crosschain application behaviors. 

## Stakeholders
Crosschain protocols can have several distinct stakeholders with direct or indirect involvement in the system. These stakeholders can be individuals, groups, or organizations and have different roles, constraints, goals, and incentives. Consequently, the types and magnitudes of risk borne by each stakeholder might vary considerably across protocols. Understanding the dynamics of crosschain risk from the perspective of different actors will aid in a more sound analysis. To this end, we identify four types of stakeholders in crosschain protocols:

#### Users
Users are the primary customers of the service offered by a crosschain protocol. They interact with the system directly to exchange assets or transfer data and value across chains. A user might directly interface with a crosschain protocol (e.g., token bridge) or through an intermediary application. A user's involvement with a protocol is typically short-lived and ends once their crosschain transaction has settled.

#### Liquidity Provider
In a crosschain asset exchange, a _liquidity provider_ is the counter-party to a user. For a fee, it exchanges its assets in one network for a user's assets in another. It might compete with other liquidity providers to offer this service and have defined performance and service-level constraints in its operations. Liquidity providers typically maintain longer exposure to the risks of a protocol and might also need to account for market-related risks beyond protocol risks.  

#### Bridge Token Holder
A common approach to enabling the transfer of assets from one chain to another is through a lock-and-mint mechanism, in which crosschain protocols lock assets on one network and mint corresponding synthetic assets on another. These synthetic assets are, in effect, a liability of the bridge that can later be redeemed for the underlying asset. We refer to any entity that holds such synthetic assets as a _bridge token holder_. A _bridge token holder_ might or might not be a user of a crosschain protocol. More importantly, such stakeholders are exposed to the idiosyncratic risks of a protocol so long as they hold the asset. If a protocol's underlying assets are compromised the corresponding synthetic assets could lose some or all of their value.

#### Bridge Validators
Crosschain protocols typically coordinate several off-chain systems and actors that collectively ensure the integrity of state communication across chains. Such entities might be responsible for verifying, validating, proving, attesting, or relaying crosschain states. How different protocols coordinate and incentivize such actors to offer specific security properties varies significantly. However, in general, _bridge validators_ are the primary entities that ensure the security and continued operation of a crosschain protocol and thus represent a significant source of potential risk to the overall system.

#### Bridge Operators
_Bridge operators_ are actors that can update or reconfigure key elements of a crosschain protocol (e.g. upgrading on-chain smart contracts, updating validator registries). How many bridge operators a protocol has, what they are allowed to change and what policies govern their actions can significantly influence the risk profile of a protocol and varies considerably across projects.

#### Bridge Developers
_Bridge developers_ design, build, test, and maintain the codebase behind a crosschain protocol. Given the complex nature of such systems, the possibility of introducing bugs and vulnerabilities is considerable. The experience and competence of bridge developers and the policies and procedures they put in place to address incidents significantly influence the level of [implementation risk](TBA) of a protocol.

## Security Risks
At its essence, crosschain communication creates a dependency relationship between two or more networks. Such dependency relationships typically involve state change in one network driving state change in another. These relationships can be _unidirectional_ or _bidirectional_, _transient_ or _persistent_. The goal of crosschain protocols is to enable and guarantee the integrity of these dependencies. Specifically, given two networks, a source, and a destination, where the state in the destination network is dependent on the state in the source network, crosschain protocols must guarantee the following core security properties:

1. Only states that are valid and final in the source network are communicated to the destination network
1. All relevant state transitions in the source network are relayed to the destination network in a timely manner
1. Any invariants that emerge from the crosschain interactions are always preserved

This document primarily discusses and assesses the risk of crosschain protocols by considering factors that affect these core security requirements. 
