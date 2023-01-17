### Liquidity Networks
Liquidity networks enable the [exchange of assets](../../01intro/introduction.md#asset-exchange) between [users](../../01intro/introduction.md#users) and [Liquidity Providers (LPs)](../../01intro/introduction.md#liquidity-provider) across different networks. For example, Alice has ETH on Ethereum and would like to swap this for AVAX on Avalanche. Bob, a liquidity provider, has sufficient AVAX on Avalanche that he is willing to swap for ETH for a fee. Liquidity networks enable these two parties to swap their assets without having to trust each other. There are a number of desirable security properties for such protocols, such as atomicity and fairness, which are discussed later in the *considerations* section.

Typically, such protocols involve liquidity providers locking their assets upfront in smart contracts. LPs can provide liquidity for several assets across different networks. A user that wants to swap its assets advertises its requirement to LPs, typically through some off-chain mechanism. LPs bid to service the request, and the best offer is selected. The specifics of this discovery and matching process between users and LPs vary across protocols. Once a user identifies its preferred LP, it commences the swap by locking its funds on the source network, thus committing to the agreed exchange terms. 

In such protocols, liquidity providers generally bear higher risk because they have funds locked for extended periods in smart contracts. These funds could be stolen because of failures in the underlying messaging protocol or hacks on the liquidity network contracts. Unlike users, LPs maintain long-term exposure to such risks of protocol failure.

There are generally three types of liquidity networks based on the degree to which they rely on underlying messaging layer protocols to coordinate the swap. The first model involves the transacting parties coordinating an exchange without needing a messaging protocol; the second relies on messaging protocols for one leg of the trade; the last depends on messaging protocol to coordinate the whole exchange. Each of these is discussed further below.

#### Local Verification
Liquidity networks that rely solely on the parties involved in the exchange verifying each other's transactions during execution and settlement are referred to as *locally verified*. Liquidity networks based on Atomic Swap protocols are *locally verified*. Atomic swaps are crosschain peer-to-peer swaps leveraging [Hash Timelock Contract (HTLC)](https://en.bitcoin.it/wiki/Hash_Time_Locked_Contracts) protocols. HTLCs ensure that the crosschain swaps are time-bound and are either executed fully within a given timeframe or aborted. If the time limit for the swap expires, the user's funds are refunded. For example, in [Connext NXTP](https://docs.connext.network/0.1.x-legacy/developers/intro), users receive a refund if a swap is not completed within 72 hours. From the user's perspective, the worst-case scenario involves having their funds locked for a fixed period of time and the opportunity cost of capital that this entails. Examples: [Connext NXTP](https://docs.connext.network/0.1.x-legacy/developers/intro) and [Liquality](https://blog.liquality.io/).

#### Hybrid Verification
In *hybrid verification* schemes, LPs and users interact through atomic swaps at the liquidity layer. This enables users to receive desired assets instantly on the destination network. On the other hand, LPs receive their assets on the source network (along with the fees for fronting liquidity to the users) via the messaging layer with latency. For example, in [Hop](https://hop.exchange), users receive desired assets instantly, whereas LPs (Hop Bonders) receive assets in 1 day via the Hop optimistic messaging protocol. Hence, these approaches offer the speed of atomic swaps and the security of optimistically verified messaging protocols.

From a security standpoint, liquidity networks that use hybrid verification mechanisms are locally verified for users and optimistically verified for LPs, where 1-of-N honest watchers ensure the safety of transactions. From the perspective of the user, the worst-case scenario involves delayed withdrawal of its funds via a slow, optimistically verified route. Examples: [Connext Amarok](https://blog.connext.network/announcing-the-amarok-network-upgrade-5046317860a4), [Hop](https://docs.hop.exchange/), and [Across](https://docs.across.to/).

#### Message Protocol Reliant Verification
These types of liquidity networks rely on the underlying messaging layer protocol to verify and coordinate swaps between parties. For example, the [Wormhole bridge](https://docs.wormhole.com/wormhole/) relies on 19 validators (called Guardians) to verify transactions on the source chain, determine their legitimacy, and release the desired assets on the destination network. 

From a security standpoint, such liquidity networks rely on the security properties of the underlying messaging layer. The worst-case scenario involves a complete loss of user and LP funds due to failures in the security of the messaging protocol.

**Considerations:**

*Safety*

- What are the trust assumptions and security properties of the underlying messaging protocol?
- Does the approach ensure atomicity of the exchange? Is there a possibility that one party might not get their owed funds? What are these conditions? Which party does this scenario affect?
- How are midway failures in multi-hop routes handled?
- Does the user always receive their requested asset, or are there scenarios where they might end up with intermediary assets (e.g., bridge-minted tokens)?
- What are the trust assumptions placed on the off-chain mechanisms that support this protocol and the parties that operate them? 

*Liveness*

- Is the role of an LP permissionless? How many LPs does the protocol have? Can these entities censor user swaps?
- Can the off-chain mechanisms that support the protocol censor transactions? 

*Other*

- What are the fairness properties of the protocol? Does it disadvantage one party over another (e.g., [optionality](https://eprint.iacr.org/2019/896))? 
- Can LPs grief users by refusing to fulfill exchange requests? If so, are there mechanisms to penalize such behavior (e.g., slashing)?
- How much liquidity does the protocol have across routes? How are liquidity shortages for in-flight transactions handled? 