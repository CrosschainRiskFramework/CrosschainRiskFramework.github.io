# Stakeholders
Cross-chain protocols can have several distinct stakeholders with direct or indirect involvement and interest in the system. These stakeholders can be individuals, groups, or organizations and often have different capabilities, constraints, goals, and incentives. Consequently, the types and magnitudes of risk borne by each stakeholder might vary considerably across protocols. Analyzing risks from the perspective of the different actors within the system enables a better understanding of the potential impact. To this end, we identify four types of stakeholders in cross-chain protocols:

## Users
Users are the primary customers of the service offered by a cross-chain protocol. They interact with the system directly to exchange assets or transfer data and value across chains. A user might directly interface with a cross-chain protocol (e.g., token bridge) or get mediated through other contracts and applications. A user's involvement with a protocol is typically short-lived and ends once their cross-chain transaction has settled.

## Liquidity Provider
In a cross-chain asset exchange, a _liquidity provider_ is the counter-party to a user. For a fee, it exchanges its assets in one network for a user's assets in another. It might compete with other liquidity providers to offer this service and have defined performance and service-level constraints in its operations. Liquidity providers typically maintain longer exposure to the risks of a protocol and might also need to account for market-related risks beyond specific protocol risks.  

## Bridge Liability Holder
A common approach to enabling the transfer of assets from one chain to another is through a lock-and-mint mechanism, in which cross-chain protocols lock assets on one network and mint corresponding synthetic assets on another. These synthetic assets are, in effect, a liability of the bridge that can later be redeemed for the underlying asset. We refer to any entity that holds such synthetic assets as a _bridge liability holder_. A _bridge liability holder_ might or might not be a user of a cross-chain protocol. More importantly, such stakeholders are exposed to the idiosyncratic risks of a protocol so long as they hold the asset. If a protocol's underlying assets are compromised the corresponding synthetic assets could lose some or all of their value.

## Bridge Validators
Cross-chain protocols typically coordinate several off-chain systems and actors that collectively ensure the integrity of state communication across chains. Such entities might be responsible for verifying, validating, proving, attesting, or relaying cross-chain states. How different protocols coordinate and incentivize such actors to offer specific security properties varies significantly. However, in general, _bridge validators_ are the primary entities that ensure the security and continued operation of a cross-chain protocols and thus represent a significant source of potential risk to the overall system.

## Bridge Operators
_Bridge operators_ are actors that can update or reconfigure key elements of a cross-chain protocol (e.g. upgrading on-chain smart contracts, updating validator registries). How many bridge operators a protocol has, what they are allowed to change and what  policies govern their actions can significantly influence the risk profile of a protocol and varies considerably across projects.

## Bridge Developers
_Bridge developers_ design, build, test, and maintain the codebase behind a cross-chain protocol. Given the complex nature of such systems, the possibility of introducing bugs and vulnerabilities is considerable. The experience and competence of bridge developers and the policies and procedures they put in place to address incidents significantly influence the level of [implementation risk](TBA) of a protocol.
