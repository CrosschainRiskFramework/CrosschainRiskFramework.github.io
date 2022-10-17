### Messaging Protocol

A cross-chain messaging protocol is responsible for communicating state transition events from applications on one network to applications on another. It should guarantee that these events are valid according to the canonical ledger state of the source network (safety) and ensure that all relevant state transitions are eventually communicated to their destination network (liveness).

From the perspective of safety, an ideal message protocol construction would introduce no additional trust assumptions beyond what is assumed about the networks themselves. This would involve a destination network independently being able to verify that a) a state transition that resulted in a given message is valid according to the state transition rules of the source network and b) that the message has been finalized on the network as per the network consensus rules of the source.

#### Full-client verification-based bridging
A full-client verification bridge involves one network validating all state transitions and consensus rules of another network, in effect achieving both properties stated above. This type of bridging retains the strongest guarantees of the underlying networks and does not introduce any additional trust assumption. However, this approach introduces significant complexities in implementation and is hard to scale across diverse ecosystems. To date, these are employed only by layer 2  chains (optimistic and ZK rollups), and not across independent L1 networks.

#### Light-client verification-based bridging
In a light-client verification bridge a destination network validates that a given block header (or state aggregate), from a source network, is valid only according to the consensus rules of a network, without executing and verifying individual state transitions. While light clients offer less security compared to full-client-based approaches, they too do not introduce additional trust assumptions, beyond those of the underlying networks. Different network protocols have different light-client protocols with differing levels of security assumptions and guarantees. The security guarantees of such bridges are subject to these limitations. We distinguish between two categories of light-client bridges:

* On-chain light-client protocol implementations: these involve implementing the light-client protocol as a smart contract on another. Typically block headers are relayed from the source network to the smart contract on a destination network for validation. An arbitrary state in a source network can then be proved against a validated block header stored by the smart contract on the destination network. Implementing, operating, and maintaining light-client-based bridges can be difficult, expensive, or infeasible, making this difficult to apply across diverse ecosystems.
* Validity Proof Bridges (aka ZK bridges)

#### Third-party attestation reliant bridging
While the above approaches offer better security guarantees because they remove the need for additional trust assumptions, they are difficult to implement and operate across diverse ecosystems. Hence, most cross-chain protocols introduce additional sources of trust in the form of third-party attestors. In general, such models rely on trusted third parties serving as oracles that attest and relay state events occurring in a source network, to a destination network. The security models of such bridges rely on the honest behavior of such attestors, either because they are game theoretically incentivized or have their reputation at stake. We generally distinguish between three categories of such bridges, based on the security model they employ.

* Proof-of-Authority approaches: rely on well-known legal entities running nodes that attest to the validity of messages from one network to another. Such bridges assume that a) parties are strongly incentivized to maintain their reputation and would thus not misbehave and b) that in the event of misbehavior legal recourse could be pursued against such entities.

  Considerations:
 
  * How many such entities are employed by the network? What are the specific honesty threshold assumptions for guaranteeing safety and liveness? What are the specific characteristics of the cryptographic schemes employed?
  * How reputable are such entities? What is the true cost of reputational damage for such entities? What is the market cap of such entities?
  * Do such entities have competing interests with users of this bridge? e.g. Trading firms that might benefit from cross-domain MEV?
  * How do the above disincentives to misbehavior compare against the TVL or total volume transacted by layers atop the messaging bridge?
  * In what jurisdictions are the entities domiciled?
  * Can these entities be coerced by regulations to censor transactions?

* Proof-of-Stake approaches: rely on a set of parties having a financial stake in honestly relaying valid state information from one network to another.

  Considerations:

  * How many such entities are employed by the network? What are the specific honesty threshold assumptions for guaranteeing safety and liveness? What are the specific characteristics of the cryptographic schemes employed?
  * How is the stake distributed across networks? (i.e. concentrated amongst few parties vs diffuse across many parties)
  * What exactly is staked by validators? Is it a bridge-specific token? What are the dynamics that drive the value of such tokens?
  * What is the cost of bribing or corrupting a threshold of such validators to violate safety or liveness?
  * How does the bridge adapt to active misbehavior by a portion of the validators?

* Optimistic approaches - honest minority (but incentive alignment that such a minority exists)

A number of protocols employ a hybrid approach, that utilizes different approaches for different legs of the cross-chain interaction.
