### Token Bridges
One of the most common crosschain use cases is the [transfer of assets](../../01intro/introduction.md#types-of-crosschain-interaction) from one network to another. This enables assets in one network to be used inside applications in another. For instance, a user might want to transfer her ETH from Ethereum to Avalanche so she can use it as collateral in a lending protocol on Avalanche. A token bridge is a protocol that enables this requirement. It often relies on an underlying messaging protocol for crosschain message communication. 

A core security requirement of such a protocol is preventing crosschain double-spends by ensuring that the original asset's value can only be realized in one network. There are two models for enabling this requirement, depending on the characteristics of the underlying asset.

#### Lock and Mint
In this model, token bridges mimic the transfer of an asset by locking the original asset in the source network and issuing a synthetic representation on the destination. The original asset remains encumbered for as long as the synthetic token exists in the destination. A user can redeem the original asset by burning the corresponding synthetic token on the destination network.

This approach is commonly employed today because it is the only way to transfer assets to a network they are not natively issued in. For instance, moving the native assets of layer-one protocols (e.g., ETH, SOL, AVAX) to different chains necessitates this model. 

*Lock and Mint* protocols must preserve the following core security invariants at all times:

1. Every synthetic token has a corresponding locked asset in the source network.
1. There can only be a single outstanding claim (i.e., synthetic token) against a locked asset.  

Thus the total supply of synthetic tokens across networks must match the number of assets locked in a source network. If these invariants fail, the synthetic tokens become partially unbacked, meaning that each asset on the destination network is not backed by an asset on the source network. In extreme cases, where no assets on the source network are backing the assets on the destination network, the synthetic tokens become worthless. Because synthetic tokens are effectively [IOUs](https://www.investopedia.com/terms/i/iou.asp) issued by the token bridge, [token holders](../../01intro/introduction.md#stakeholders) carry perpetual exposure to such risks. 

From a design perspective, there are two inherent risks that this model creates: 1) funds locked on a source network create sizable honeypots that attract malicious actors 2) synthetic assets carry a perpetual risk for token holders. This risk is often hidden from token holders because bridge-specific synthetic assets are usually not distinctly identified as such. 

**Considerations:**
The following are essential considerations for [*Users*](../../01intro/introduction.md#stakeholders) and [*Token Holders*](../../01intro/introduction.md#stakeholders)

- Are synthetic assets clearly labeled and identifiable?
- Are there alternatives to using this model for the specific asset? i.e., is there another version of the asset (or a substitute asset) that is natively issued on the destination and could be used instead of the bridge-wrapped asset?
- Transaction Failure Scenarios:
    - Does the protocol ensure atomicity of crosschain transactions? 
    - If not, how are failed transactions handled?
    - Do refunds require trusted intermediaries (admins and bridge operators)?
- How efficiently are refunds processed?
- What are the trust assumptions and security properties of the underlying messaging protocol?

#### Burn and Mint 

Some assets have a specified issuer that can authoritatively mint original assets on several networks (e.g., Circle for USDC). A user that holds such assets in one network might want to swap them for the same asset in another network. While [Liquidity Networks](liquidity-networks.md) generally satisfy this requirement, an issuer might want to rebalance the supply of these assets across networks based on differences in demand. *Burn-and-mint* mechanism address this requirement. Specifically, to move an asset from one network to another, the asset is first burnt on the source and an equivalent amount minted on the destination. The process ensures that the total supply of assets across networks remains constant. 

The risk posed by this mechanism is comparatively lower than *lock-and-mint* mechanisms for a couple of reasons: 1) it does not create honeypots that attract malicious actors, and 2) token holders possess original assets instead of bridge-specific [IOUs](https://www.investopedia.com/terms/i/iou.asp).  

**Considerations:**

- What are the trust assumptions and security properties of the underlying messaging protocol?
- Transaction Failure Scenarios:
    - Does the protocol ensure atomicity of crosschain transactions? 
    - If not, how are failed transactions handled?