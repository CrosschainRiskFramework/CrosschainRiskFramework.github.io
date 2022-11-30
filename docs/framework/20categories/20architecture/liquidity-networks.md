### Liquidity Networks
Liquidity networks enable users to transfer already minted assets from one chain to another. With such protocols, there's no ‘bridging’ of assets, i.e., no assets move across chains. Instead, assets are exchanged between one user (liquidity providers, aka LPs) and another bridge user on different networks, resulting in a cross-chain swap. For example, a user receives the desired asset on the destination network via the LP. In return, the LP receives the user’s assets on the source network and fees for providing the desired asset. 

Typically, LP funds within a liquidity network are collected and locked in a smart contract (liquidity pool) to facilitate quick cross-chain swaps. When a user initiates a transaction, the desired assets are released from the smart contract on the destination network. In essence, liquidity networks work similarly to peer-to-peer networks where LPs, acting as routers, own and distribute liquidity across chains. 

The relationship between the LP and the users depends on the mechanism used by the liquidity network:

**Atomic swaps using HTLCs (locally verified)** 

Atomic swaps are cross-chain peer-to-peer swaps leveraging a technology called hash Timelock Contracts (HTLCs). HTLCs ensure that the cross-chain swaps are time-bound and are either executed within a given timeframe or don’t go through at all (and users’ funds are returned after a specific period). For example, [in Connext NXTP](https://github.com/connext/nxtp), users either receive the desired assets on the destination network instantly, or if the transaction fails, they can claim their assets on the source network after the locking period of 72h.

From a security standpoint, liquidity networks that use atomic swap systems are locally verified protocols. This means only the LP and the user verify transactions. The worst-case scenario involves locking of user funds for a fixed period, resulting in a delayed withdrawal. Examples: Connext NXTP, [Liquality](https://liquality.io).

**Conditional transfers (Hybrid verification: locally verified for users, optimistically verified for LPs)** 

Conditional transfers offer the speed of atomic swaps and the security of optimistically verified messaging protocols. LPs and users interact through atomic swaps at the liquidity layer. This enables users to receive desired assets instantly on the destination network. On the other hand, LPs receive their assets on the source network (along with the fees for fronting liquidity to the users) via the messaging layer with latency. For example, [in Hop](https://hop.exchange), users receive desired assets instantly, whereas LPs (Hop Bonders) receive assets in 1 day via the Hop optimistic messaging protocol. 

From a security standpoint, liquidity networks that use conditional transfers are locally verified for users and optimistically verified for LPs, where 1/n watchers verify transactions. The worst-case scenario involves delayed withdrawal of funds for the user via a slow route. Examples: [Connext Amarok](https://blog.connext.network/announcing-the-amarok-network-upgrade-5046317860a4), Hop, [Across](https://across.to).

**External validators and federations (externally verified)**

Validator-based liquidity networks enable users to transfer funds across chains via a trusted set of third-party validators that reach a consensus to determine whether to release users’ assets on the destination network. For example, Wormhole relies on 19 validators (called Guardians) to verify transactions on the source chain, determine their legitimacy, and release the desired assets on the destination network. 

From a security standpoint, liquidity networks using validators are externally verified, where a group of validators verifies the transaction. The worst-case scenario involves a complete loss of user funds due to the malicious collusion of external validators. Examples: [Wormhole](https://wormhole.com), centralized exchanges.
