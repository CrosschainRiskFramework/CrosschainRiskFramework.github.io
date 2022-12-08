### Bridge Aggregation Protocols
Bridge aggregators operate similarly to [Decentralised Exchange (DEX) aggregators](https://thedefiant.io/what-is-a-dex-aggregator). They integrate several different bridges and enable users to find the most optimal option for their cross-chain asset [exchange](../../01intro/introduction.md#asset-exchange) and [transfer](../../01intro/introduction.md#asset-transfer) requirements, based on factors such as cost, speed, slippage, and security. Because bridges often only support a limited number of tokens, bridge aggregators also integrate DEXs and DEX aggregators, which allows users to exchange a wide range of assets across chains. For example, if a user wants to swap USDC on Arbitrum to ETH on Ethereum, they would need a bridge aggregator that supports DEXs. Such an aggregator would transfer USDC from Arbitrum to Ethereum and swap it for ETH via a DEX. 

Most aggregators have an on-chain and an off-chain component for routing crosschain transactions:

* **Off-chain routing algorithm** finds the most efficient route for a crosschain transfer. This is accomplished by comparing the routes and quotes provided by different liquidity sources (bridges, DEXs, DEX aggregators) for a specific trade and selecting a recommended route based on the rule sets by the bridge aggregator’s internal routing algorithm, and the user’s preferences. From there, an API communicates this information to the bridge aggregator’s front-end, which showcases the routes to the user. Although centralized, the off-chain component is vital for any bridge aggregator because all bridges provide their quotes and routes off-chain, thus requiring bridge aggregators, by default, to operate their routing algorithm and APIs off-chain. Moreover, doing all the computation off-chain makes delivering the most efficient route for a crosschain transfer faster and cheaper, improving the user experience.

* **On-chain smart contract aggregates** the smart contracts for each bridge, DEX, and DEX aggregator supported by the bridge aggregator and executes the crosschain transaction after the user selects a route. However, while the bridge aggregator’s smart contract abstracts the complexity of dealing with multiple bridges and DEXs, it adds another layer of smart contract risks.

Bridge aggregation protocols can be classified based on how they interact with their users:

**Indirectly via other dApps**

In such systems, bridge aggregation protocols work in the background and do not directly interact with the end users. Instead, the bridge aggregation protocols are integrated into a dApp’s crosschain service offering. For example, in [MetaMask Bridges](https://portfolio.metamask.io/bridge), crosschain transfers are executed via two bridge aggregation protocols: [LI.FI](https://li.fi/) and [Socket](https://socket.tech/).

The benefits of using a bridge aggregator over an individual bridge for dApps include:

* Access to liquidity from multiple sources (bridges, DEXs, and DEX aggregators).
* Connectivity with more blockchains.
* No single point of failure, as bridge aggregators provide fallback solutions in the form of alternate bridges.
* Improved user experience as users get the optimal route for a crosschain swap.
* Bridge aggregators bear the costs of integrating and maintaining multiple bridges.
* Assessment of bridges is complicated and time-consuming as there are many factors to consider, such as speed, costs, security, trust assumptions, and others. Bridge aggregators save the dApps from the hassle of making this assessment and choosing a bridge as they get access to multiple bridges, enabling them to inherit the strengths of each bridge and overcome their limitations.

**Directly via their own front-end**

In such systems, bridge aggregation protocols interact directly with the end-user via front-ends hosted by them. For example, LI.FI and Socket offer bridge aggregation services directly to users via [TransferTo.xyz](https://transferto.xyz/swap) and [Bungee](https://bungee.exchange/), respectively.

The benefits of using a bridge aggregator over an individual bridge for users include:

* The convenience of having multiple bridges, DEXs, and DEX aggregators all on one platform saves users time and money.
* Rather than assessing bridges and choosing which one to use, users get access to multiple bridges (and DEXs).
* Finding the optimal route and quote for their crosschain swap via routing algorithms.
* Ability to compare different routes and choose one based on their preference.
