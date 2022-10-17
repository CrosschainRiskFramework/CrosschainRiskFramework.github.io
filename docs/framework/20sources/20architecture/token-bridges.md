
### Token Bridges
Token bridges are protocols that enable the transfer of assets from one network 
to another. This can be enacted using either a lock-and-mint or a burn-and-mint 
mechanism. In both cases, the protocol involves minting synthetic assets on a 
destination that are claimable for a corresponding amount of underlying assets 
at a later time. The invariant such protocols must preserve is that the value 
of an asset only resides in one place at a given time and that the total 
supply of synthetic assets matches the total underlying. Scenarios in 
which either locked assets on a source network are stolen or synthetic 
assets are arbitrarily minted on a destination network, break these 
invariants. This creates a perpetual risk for token holders of 
synthetic assets, in which these assets could become worthless 
in the event of such failures.

Moreover, lock-and-mint token bridges in particular create 
honey pots that make them an ideal target for malicious 
actors. A significant portion of bridge hacks over the 
last couple of years has involved this source of risk.



