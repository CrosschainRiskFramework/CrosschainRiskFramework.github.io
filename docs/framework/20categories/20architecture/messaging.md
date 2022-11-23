### Messaging Protocol

A cross-chain messaging protocol is responsible for communicating state transition events from applications on one network to applications on another. It should guarantee that these events are valid according to the canonical ledger state of the source network (safety) and ensure that all relevant state transitions are eventually communicated to their destination network (liveness).

From the perspective of safety, an ideal message protocol construction would not introduce additional trust assumptions beyond what is assumed about the networks themselves. This would involve destination networks independently verifying that:
1. A state transition that resulted in a given message is valid according to the state transition rules of the source network and
1. That the message has been finalized on the network as per the network consensus rules of the source.

#### State Validating Bridges
A state verification bridge involves one network validating state transitions and consensus rules of another, in effect achieving both properties stated above. This type of bridging retains the strongest guarantees of the underlying networks and does not introduce new trust assumptions. The native bridge between rollups (Optimistic and ZK rollups) and their underlying layer-1 employ this model. While this model offers significant security advantages applying it across independent layer-1 networks is complex, costly, and not broadly viable at present.  

#### Consensus Verifying Bridges
In a light-client verification bridge, a destination network validates that a given block header (or state aggregate) from a source network is valid only according to the consensus rules of a network without executing and verifying individual state transitions. While light clients offer less security compared to full-client-based approaches, they, too, do not introduce additional trust assumptions beyond those of the underlying networks. Light-client protocols do not have the same security assumptions and guarantees. The security guarantees of such bridges are subject to these limitations. We distinguish between two categories of light-client bridges:

* On-chain light-client protocol implementations: these involve implementing the light-client protocol as a smart contract on another. Typically block headers are relayed from the source network to the smart contract on a destination network for validation. An arbitrary state in a source network can then be proved against a validated block header stored by the smart contract on the destination network. Implementing, operating, and maintaining light-client-based bridges can be difficult, expensive, or infeasible, making this difficult to apply across diverse ecosystems.
* Validity Proof Bridges (aka ZK bridges)

#### External Validator Bridges
While the above approaches offer better security guarantees because they remove the need for additional trust assumptions, they are complex and costly to build and operate across diverse ecosystems. Hence, most cross-chain protocols introduce other sources of trust in the form of third-party attestors. In general, such models rely on trusted third parties serving as oracles that attest and relay state events occurring in a source network to a destination network. The security models of such bridges rely on the honest behavior of such attestors because they are game theoretically incentivized or have their reputation at stake. We generally distinguish between three categories of such bridges based on the security model they employ.

* Proof-of-Authority approaches: rely on well-known legal entities running nodes that attest to the validity of messages from one network to another. Such bridges assume that a) parties are strongly incentivized to maintain their reputation and would thus not misbehave and b) that in the event of misbehavior, legal recourse could be pursued against such entities.

  Considerations:
  * How many such entities are employed by the network? What are the specific honesty threshold assumptions for guaranteeing safety and liveness? What are the particular characteristics of the cryptographic schemes used?
  * How reputable are such entities? What is the actual cost of reputational damage for such entities? What is the market cap of such entities?
  * Do such entities have competing interests with users of this bridge? e.g., Trading firms that might benefit from cross-domain MEV?
  * How do the above disincentives to misbehavior compare against the TVL or total volume transacted by layers atop the messaging bridge?
  * In what jurisdictions the entities are domiciled?
  * Can regulations coerce these entities to censor transactions?


* Proof-of-Stake approaches: rely on a set of parties having a financial stake in honestly relaying valid state information from one network to another.

  Considerations:
  * How many such entities are employed by the network? What are the specific honesty threshold assumptions for guaranteeing safety and liveness? What are the particular characteristics of the cryptographic schemes used?
  * How is the stake distributed across networks? (i.e., concentrated amongst few parties vs. diffuse across many parties)
  * What exactly is staked by validators? Is it a bridge-specific token? What are the dynamics that drive the value of such tokens?
  * What is the cost of bribing or corrupting a threshold of such validators to violate safety or liveness?
  * How does the bridge adapt to active misbehavior by a portion of the validators?

* Optimistic approaches - honest minority (but incentive alignment that such a minority exists)

Several protocols employ a hybrid approach that utilizes different approaches for different legs of the cross-chain interaction.
