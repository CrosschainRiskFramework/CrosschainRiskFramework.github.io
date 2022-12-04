### Token Bridges
One of the most common cross-chain use cases is the [transfer of assets](../../01intro/introduction.md#types-of-crosschain-interaction) from one network to another. This enables an asset in one network to be used inside applications in another. For instance, a user might want to transfer her ETH from Ethereum to Avalanche so she can use it as collateral in a lending protocol on Avalanche. A token bridge is a protocol that enables this requirement. It often relies on an underlying messaging protocol for cross-chain message communication. 

A core security requirement of such a protocol is preventing cross-chain double-spends by ensuring that the original asset's value can only be realized in one network. There are two models for enabling this requirement, depending on the characteristics of the underlying asset.

#### Lock and Mint
In this model, token bridges mimic the transfer of an asset by locking the original asset in the source network and issuing synthetic representations on the destination. The original asset remains encumbered for as long as a synthetic token exists in the destination network. A user can redeem the original asset by burning the corresponding synthetic token in the destination network. 

This approach is commonly employed today because it is the only viable model for transferring assets to a network they are not natively issued in. For instance, moving the native assets of layer-one protocols (e.g., ETH, SOL, AVAX) to different chains necessitates this model. 

Such protocols must preserve the following core security invariants at all times:

1. Every synthetic token has a corresponding locked asset in the source network.
1. There can only be a single outstanding claim (i.e., synthetic token) against a locked asset.  

Thus the total supply of synthetic tokens across networks must match the number of assets locked in a source network. If these invariants fail, synthetic tokens can become worthless. Because the synthetic token is effectively an IOU issued by the token bridge to the [token holder](../../10stakeholders/stakeholders.md#stakeholders), the holder carries perpetual exposure to such risks. 

From a design perspective, there are two inherent risks that this model creates: 1) funds locked on a source network create sizable honeypots that attract malicious actors 2) synthetic assets carry a perpetual risk for token holders. This risk is often hidden from token holders because bridge-specific synthetic assets are usually not distinctly identified as such. 

*Considerations:*

- Are there alternatives to using this model for the specific asset? i.e., is there a natively issued version of the asset on the destination network that could be used instead?
- Are synthetic assets clearly labeled and identifiable to users?
- How is the atomicity of the cross-chain mechanism ensured? Does this introduce new trusted intermediaries (admins and bridge operators) to resolve failed transactions? 
- What are the trust assumptions and security properties of the underlying messaging protocol?

#### Burn and Mint 

Some assets have a specified issuer that can authoritatively mint original assets on several networks (e.g., Circle for USDC). A user that holds such assets in one network might want to swap them for the same asset in another network. While [Liquidity Networks]() generally satisfy this requirement, an issuer might want to rebalance the supply of these assets across networks based on differences in demand.  

Token bridges address this requirement through a burn-and-mint mechanism. Specifically, to move an asset from one network to another, the asset is first burnt on the source and an equivalent amount minted on the destination. The burning-and-minting of the asset is performed by the asset's smart contract, while the token bridge orchestrates the required actions across chains using an underlying messaging protocol.

The risk posed by this mechanism is comparatively lower than lock-and-mint mechanisms for a couple of reasons: 1) it does not require locking assets and creating honeypots 2) token holders hold original assets instead of bridge-specific IOUs.  

*Considerations:*

- How is the atomicity of the cross-chain mechanism ensured? Does this introduce new trusted intermediaries (admins and bridge operators) to resolve failed transactions? 
- What are the trust assumptions and security properties of the underlying messaging protocol?