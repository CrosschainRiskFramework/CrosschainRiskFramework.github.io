# Introduction
With several layer-one protocols gaining meaningful traction over the last few years and layer-two protocols taking [center stage in the scalability roadmap for Ethereum](https://vitalik.ca/general/2021/12/06/endgame.html), it is increasingly becoming clear that the future will be multichain. This thesis is further reinforced by emerging patterns such as [modular blockchains](https://www.alchemy.com/overviews/modular-vs-monolithic-blockchains), [application-specific chains](https://medium.com/1kxnetwork/application-specific-blockchains-9a36511c832), and [fractal scaling](https://medium.com/starkware/fractal-scaling-from-l2-to-l3-7fe238ecfb4f). A multichain world is one in which disparate chains co-exist as thriving ecosystems. 

In the absence of a countervailing force, the proliferation of chains would naturally lead to increased fragmentation and the siloing of ecosystems. Crosschain protocols directly address this problem by enabling interoperation across distinct chains. They reduce fragmentation, enable scalability, and improve market efficiency. In addition, such protocols potentially open up new design spaces for novel crosschain native applications and use cases. Hence, crosschain protocols have emerged as a crucial building block enabling the multichain future. 

The growth and adoption of such protocols over the last couple of years have been astounding. The total value locked in token bridges on Ethereum alone, which only offers a partial picture of the scale of adoption of such protocols, reached a high of US$27B in late 2021. There are currently numerous crosschain-focused projects and significant venture capital funding backing such efforts.

The flip side to this rapid growth and adoption has been the slew of high-profile hacks and failures of these protocols. Between 2021 and 2022, more than [US$2.5B was stolen in bridge hacks](https://defillama.com/hacks), which is more than two-thirds of all DeFI hacks in that period. In addition, roughly US$1B was at risk from vulnerabilities discovered in such protocols. The knock-on effects of these failures included extended disruptions to underlying chains and increased regulatory scrutiny. Overall, these events have undermined confidence in crosschain infrastructure and the viability of a multichain future. They have also highlighted shortcomings in how crosschain protocols are designed, built, and operated today and the need to understand their risks and challenges better.

To this end, this document provides a high-level systematic overview of the security risks in crosschain protocols by identifying, classifying, and analyzing the risk elements inherent in the design, implementation, and operation of such infrastructure. In addition, it offers a set of risk controls and best practices to mitigate the likelihood and severity of risks. While this document provides a general toolkit for reasoning about crosschain protocols, it does not directly analyze individual protocols. 

While this document is still a work in progress, its ultimate objective is to enable progress toward more secure, robust, and decentralized crosschain protocols that can serve as solid foundations for a multichain future. We highly encourage contributions and feedback from the community towards this end.

## Types of Crosschain Interaction
Broadly defined, crosschain protocols enable the exchange of data and value across chains through one of the following three types of interactions:

#### Asset Exchange
Asset Exchange involves coordinating the transfer of ownership of an asset in one [network](../../faq/faq.md#what-is-a-network) with a corresponding transfer of ownership in another. This enables two or more parties to swap assets across networks under pre-agreed exchange terms.

#### Asset Transfer
Asset Transfer involves moving the value of an asset from a source ledger to a destination ledger. It enables assets in one network to be used inside applications in another. For instance, a user might want to transfer her ETH from Ethereum to Avalanche so she can use it as collateral in a lending protocol on Avalanche. This typically involves locking an asset in the source ledger and minting a synthetic representation on the destination ledger.

#### General-purpose Messaging
General-purpose messaging refers to the communication of any data across chains. It can enable asset exchanges and transfers but also orchestrate complex application behavior across chains for a broad range of use cases. Examples include coordinating and managing DAO governance and actions across chains. 

## Stakeholders
Crosschain protocols can have several distinct stakeholders with direct or indirect involvement in the system. These stakeholders can be individuals, groups, or organizations and have different roles, constraints, goals, and incentives. Consequently, the types and magnitudes of risk borne by each stakeholder might vary considerably across protocols. Understanding the dynamics of crosschain risk from the perspective of different actors will aid in a more sound analysis. To this end, we identify the main stakeholders in crosschain protocols below:

#### Users
Users are the primary customers of the service offered by a crosschain protocol. They interact with the system directly to exchange assets or transfer data and value across chains. A user might directly interface with a crosschain protocol (e.g., token bridge) or through an intermediary application. A user's involvement with a protocol is typically short-lived and ends once their crosschain transaction has settled.

#### Liquidity Providers
In a crosschain asset exchange, a _liquidity provider_ is the counter-party to a user. For a fee, it exchanges its assets in one network for a user's assets in another. It might compete with other liquidity providers to offer this service and have defined performance and service-level constraints in its operations. Liquidity providers typically maintain longer exposure to the risks of a protocol and might also need to account for market-related risks beyond protocol risks.  

#### Bridge-wrapped Token Holders
A common approach to enabling the transfer of assets from one chain to another is through a lock-and-mint mechanism, in which crosschain protocols lock assets on one network and mint corresponding synthetic assets on another. These synthetic assets are, in effect, a liability of the bridge that can later be redeemed for the underlying asset. We refer to any entity that holds such synthetic assets as a _bridge token holder_. A _bridge token holder_ might or might not be a user of a crosschain protocol. More importantly, such stakeholders are exposed to the idiosyncratic risks of a protocol so long as they hold the asset. If a protocol's underlying assets are compromised the corresponding synthetic assets could lose some or all of their value.

#### Bridge Validators
Crosschain protocols typically coordinate several off-chain systems and actors that collectively ensure the integrity of state communication across chains. Such entities might be responsible for verifying, validating, proving, attesting, or relaying crosschain states. How different protocols coordinate and incentivize such actors to offer specific security properties varies significantly. However, in general, _bridge validators_ are the primary entities that ensure the security and continued operation of a crosschain protocol and thus represent a significant source of potential risk to the overall system.

#### Bridge Operators
_Bridge operators_ are actors that can update or reconfigure key elements of a crosschain protocol (e.g., upgrading on-chain smart contracts, updating validator registries, or moving contract funds). How many bridge operators a protocol has, what they are allowed to change and what policies govern their actions can significantly influence the risk profile of a protocol and varies considerably across projects.

#### Bridge Developers
_Bridge developers_ design, build, test, and maintain the codebase behind a crosschain protocol. Given the complex nature of such systems, the possibility of introducing bugs and vulnerabilities is considerable. The experience and competence of such teams, their development practices, and the policies and procedures they put in place to respond to incidents significantly influence a protocol's level of [implementation risk](../20categories/30implementation/protocol-implementation-risk.md).


In addition to the direct stakeholders discussed above, crosschain protocols also have indirect stakeholders. These entities have interest in or influence over the security and efficacy of crosschain protocols, even though they might not directly interact with them. Indirect stakeholders include: 

- Blockchain Network Participants: Recent bridge hacks have shown how failures in crosschain protocols can cause significant disruptions and halts of the underlying blockchains, impacting all network participants. 

- Crosschain Applications: Applications built atop crosschain protocols have independent economic value that could influence the security of the underlying bridge. In addition, they have their own stakeholders that are impacted by the operations of the crosschain protocol.

- Bridge Protocol Investors: Investors of bridge protocols can directly or indirectly influence the operations and security of a protocol. For instance, the security guarantees of Proof-of-Stake bridges depend on the value of the bridge tokens staked. The market actions of investors could significantly influence the price of these tokens and consequently the security of the bridge.

For brevity, the rest of this document primarily focuses only on direct stakeholders of crosschain protocols.

## Security Risks
At its essence, crosschain communication creates a dependency relationship between two or more networks. Such dependency relationships typically involve state change in one network driving state change in another. These relationships can be _unidirectional_ or _bidirectional_, _transient_ or _persistent_. The goal of crosschain protocols is to enable and guarantee the integrity of these dependencies. Specifically, given two networks, a source, and a destination, where the state in the destination network is dependent on the state in the source network, crosschain protocols must guarantee the following core security properties:

1. Only states that are valid and final in the source network are communicated to the destination network
1. All relevant state transitions in the source network are relayed to the destination network in a timely manner
1. Any invariants that emerge from the crosschain interactions are preserved

This document primarily discusses and assesses the risk of crosschain protocols by considering factors that affect these core security requirements. 
