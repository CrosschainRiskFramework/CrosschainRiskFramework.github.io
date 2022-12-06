### Messaging Protocol
Messaging protocols provide the following three foundational capabilities that are relied upon by crosschain applications.

1. Transmission of state information from a source network to a destination network
1. Ensuring the validity of any information from a foreign network

Messaging protocols must ensure the transmission of all crosschain messages (capability 1) while providing strong guarantees on the validity of crosschain events (capability 2) according to the canonical ledger state of the source network. The former mainly highlights liveness and censorship resistance considerations, while the latter relates to safety.

The architecture of crosschain messages is largely differentiated in how they offer guarantees around safety (capability 2). An ideal construction would introduce no additional trust assumptions beyond what is assumed about the networks. This would involve destination networks independently:

1. Validating that a state transition that resulted in a given message is valid according to the state transition rules of the source network and
1. Verifying that the message is final on the network as per the consensus rules of the source network.

A protocol that performs one or both of the above verifications to ensure the validity of a remote network's state is considered *trustless*. Conversely, a protocol that relies on intermediaries, or a subset of network validators, vouching for the validity of a remote state is considered *trusted*, or *semi-trusted*. In line with this, four broad architectural patterns are identified below. Not all crosschain protocols in the wild neatly fit into these categories, and some employ hybrid approaches. 

#### State Validating Protocols
In *State Validating Protocols*, a destination chain independently verifies that any state it receives is valid and final according to the source network's state transition and consensus rules. This model inherits the security guarantees of the underlying networks without introducing new trust assumptions.  

The only examples of such architecture, at present, are the native bridges between layer-one networks and their associated rollups (Optimistic and Zero-Knowledge rollups). In such models, there is, in effect, only a single source of truth, the state of the layer-one network. This is different from crosschain communication across independent layer-one networks. Hence, while this model offers significant security advantages, applying it across separate networks is currently not viable. However, with advances in Zero-Knowledge cryptography, this could change. Efforts such as [stateless Ethereum](https://docs.ethhub.io/ethereum-roadmap/ethereum-2.0/stateless-clients/) focus on having succinct proofs of the network's state that clients can independently verify. An example of a protocol that offers similar properties is the [Mina protocol](https://minaprotocol.com/). Such capabilities could eventually enable state-validating protocols across distinct layer-ones.

<figure markdown>
  ![State Validating Protocols](images/state-validating-bridges.png){width=650}
  <figcaption>State Validating Protocols</figcaption>
</figure>

*Considerations:* While this approach offers strong security guarantees from a design perspective, it is worth noting that implementation and operational risks are still present.

#### Consensus Verifying Protocols
In *Consensus Verifying Protocols*, a destination network independently verifies that any state received from a source chain has been finalized according to the source chain's consensus rules. Unlike *State Validating Protocols*, this approach does not execute or verify that the transaction that created the state is valid. Hence, this approach offers less security than *State Validating Protocols*. However, like *State Validating Protocols*, it does not introduce additional trust assumptions beyond those of the underlying networks. 

Examples of the type of verification performed by *Consensus Verifying Protocotols* include checking that sufficient proof-of-work has been expended on a block, in the case of Proo-of-Work protocols, or that a quorum of network validators has signed a block in BFT-based protocols. A *Consensus Verifying Protocol*, in effect, implements a light-client protocol of a source network on a  destination network and thus inherits the associated light-client protocol's security properties, limitations, and potential attack vectors. For instance, a light-client protocol for Ethereum Proof-of-Stake does not verify full consensus. Instead, it relies on the attestations of a subset of 512 validators called the sync committee, randomly selected and rotated every 27 hours. Because of the relatively small size of this validator set and the fact that they, at present, cannot be slashed for equivocating, this model offers weaker security guarantees than full-consensus verification or state validating approaches. 

A significant constraint to the overall viability of such approaches is the complexity associated with building and maintaining such protocols and the prohibitive costs associated with operating them. In addition, the cost of running such infrastructure is a factor of the source network's block production rate rather than a function of the demand for crosschain messaging. Hence, such bridges might need to charge high fees and gain significant usage to offset operation costs. 

There are two distinct models for constructing *Consensus Verifying Protocols*. They primarily differ based on whether the consensus verification is performed on-chain or off-chain. 

##### On-chain Consensus Verification
In this model, block headers from a source network are sent to a destination network by off-chain actors called Relayers. The destination chain then performs consensus verification checks on the block, typically through logic implemented in a smart contract. Users can then prove that a state exists in the source network using the verified block header and trigger a subsequent action on the destination chain. Importantly, this model typically implements the consensus verification logic in an on-chain smart contract. Because of the constraints on most smart contract languages and runtime environments, such models can be complicated to build and prohibitively expensive to operate (i.e., gas costs associated with verifying consensus on-chain).

<figure markdown>
  ![consensus validating bridges](images/consensus-verifying-bridges.png){width=650}
  <figcaption>Consensus Verifying Protocols</figcaption>
</figure>

*Considerations*

- How does the protocol deal with the security limitations and potential attack vectors of the associated light-client protocols? (e.g., Eclipse Attacks, Long-range attacks)
- Is the role of relaying blocks across chains permissionless? If the role is permissioned, then Relayers can censor transactions.
- How long can the bridge go without receiving new blocks before the bridge's security is affected? e.g., how does the protocol deal with a weak subjectivity period?
- What are the financial incentives for relayers? Given these entities incur network fees associated with relaying blocks to different destination networks, how are they compensated? Is this model sustainable?
- What are the costs of operating the bridge? Are these sustainable under low-demand scenarios? 
- Can the on-chain implementation adapt to changes in the source network's consensus protocol? What are there challenges and constraints to making such changes?
- The increased complexity of building such protocols significantly increases implementation risk.

##### Off-chain Consensus Verification
In this model, an off-chain system called the *Prover* generates a *Succinct Non-Interactive Argument of Knowledge (SNARK)* proof that a block from a source network has been finalized according to its consensus rules. The proof, and the associated block header, are sent to one or more destination chains by Relayers. Destination chains verify the validity of the proof using logic implemented in a smart contract (*Verifier*). If the proof is correct, the associated block header is considered valid and can be used to prove the existence of any state in the source network. These types of bridges are also referred to as Zero-knowledge Bridges (ZK Bridges). However, this terminology is misleading, as such protocols rely only on the succinctness properties of SNARKs and do not involve information hiding (i.e., Zero-knowledge).

<figure markdown>
  ![Validity Proof Protocols](images/zk-bridges.png){width=700}
  <figcaption>Validaity Proof Protocols (ZK Bridges)</figcaption>
</figure>

The same considerations as those laid out for *On-chain Consensus Verification* schemes apply to these protocols. Additional considerations are listed below.

*Considerations*

- Is the role of prover permissionless? 
- If the prover role is permissioned: how many provers are there? What are the criteria for becoming a prover? In general, more provers are desirable. However, there are generally high costs to operating a prover. Some of the reasons why more provers are desirable are:
    - Provers can technically censor transactions or become a source of liveness issues for the network
    - Carrying out an eclipse attack against a single prover is more tractable than several provers.
- Are there trusted setup assumptions of the underlying cryptographic mechanisms?
- The increased complexity of building such protocols increases implementation risk.

#### Third-party Attestation Protocols
While the above approaches offer better security guarantees because they remove the need for additional trust assumptions, they are complex and costly to build, operate, and scale across diverse ecosystems. Hence, most crosschain protocols introduce intermediary sources of trust in the form of third-party attestors (also referred to as validators). These third-party attestors attest to the validity of states in a source network and then relay them over to a destination network. These protocols generally require a majority of attestors to certify a state for it to be considered valid by a destination chain. 

<figure markdown>
  ![third-party attestation bridges](images/external-validator-set-bridges.png){width=650}
  <figcaption>Third-party Attestation Protocols</figcaption>
</figure>

<figure markdown>
  ![third-party attestation bridges with intermediary network](images/external-validator-network-bridges.png){width=700}
  <figcaption>Third-party Attestation Protocols with Intermediary Network</figcaption>
</figure>

Protocols in this category vary widely on at least the following three dimensions:

1. Coordination mechanism: Off-chain communication, Dedicated intermediary network
1. Cryptographic mechanism: Multi-Signature, Threshold signature, Trusted Execution Environment (e.g., Intel SGX)
1. Security model (Proof-of-Authority, Proof-of-Stake)

The security model of these protocols defines the security properties and assumptions about the third-party attestors. 
There are generally two models, Proof-of-Authority and Proof-of-Stake, which are further discussed below.

##### Proof-of-Authority 

Proof-of-Authority models rely on reputable legal entities serving as attestors. These bridges assume that a) such parties are strongly incentivized to maintain their reputation and would thus not misbehave and b) that in the event of misbehavior, stakeholders can pursue legal recourse against such entities. These factors are difficult to objectively and quantitatively reason about and primarily rely on external structural assurances (e.g., legal systems) instead of internal protocol mechanisms.

  *Considerations*

  * How many distinct attestors does the protocol have? What are the specific honesty threshold assumptions for guaranteeing safety and liveness? What are the particular characteristics of the cryptographic schemes used?
  * How reputable are such entities? What is the actual cost of reputational damage for such entities? What is the market cap of such entities?
  * Do such entities have competing interests with users of this bridge? e.g., Trading firms that might benefit from cross-domain MEV?
  * Can the claims around decentralization be verified on-chain? For instance: 
    * The number of validators and the threshold for achieving a quorum. Multi-signature schemes are easier to verify on-chain compared to MPC or threshold signature schemes. 
    * The active validator set. While a bridge might employ many validators, it is possible that only a few actively participate in validating and attesting to messages. This could be because the economics of validating messages are not worthwhile to some validators. This means that the effective validator set is smaller, and the decentralization and security guarantees of the bridge weaker. The [Ronin bridge hack](https://rekt.news/ronin-rekt/) highlights an example of this scenario.
  * How do the above disincentives to misbehavior compare against the TVL or total volume transacted by layers atop the messaging bridge?
  * In what jurisdictions are the entities domiciled?
  * Can regulations coerce these entities to censor transactions?

##### Proof-of-Stake

Proof-of-Stake models rely on validators having financial incentives to behave honestly according to the rules of the protocol. This is typically achieved by having each validator stake funds in the protocol that can be slashed if the validator misbehaves. This model relies on crypto-economic guarantees and metes immediate penalties for misbehavior, unlike proof-of-authority schemes. 

   *Considerations*

  * How many distinct attestors does the protocol have? What are the specific thresholds for guaranteeing safety and liveness? What are the particular characteristics of the cryptographic schemes used?
  * Can the claims around decentralization be verified on-chain? For instance: 
    * The distribution of staked tokens across validators (i.e., concentrated amongst few parties vs. diffuse across many parties)
    * The number of validators and the threshold for achieving a quorum (multi-signature schemes might be easier to verify on-chain than threshold signature schemes). 
    * The active validator set. While a bridge might employ many validators, it is possible that only a few actively participate in validating and attesting to messages. 
  * What exactly is staked by validators? Is it a bridge-specific token? What are the dynamics that drive the value of such tokens? How liquid is the token?
  * How does the value of staked funds compare against the volume of assets transacted across the bridge?
  * What is the cost of bribing or corrupting a threshold of such validators to violate safety or liveness?
  * How does the bridge adapt to active misbehavior by a portion of the validators?

#### Optimistic Protocols
Optimistic protocols rely on agents that validate crosschain transactions by signing a merkle root with data from the source network and post it on the destination network. Once this data is posted, a challenge window begins, during which anyone monitoring the bridging system can challenge a fraudulent transaction by submitting fraud proofs on the source network and prevent it from being confirmed on the destination network. Such bridges assume that a) agents are incentivized to sign only legitimate transactions because their bonded funds will be slashed if they act maliciously and b) that in the event an agent does sign a fraudulent transaction, one honest actor will be watching the system, and they will flag the fraudulent transaction by submitting a fraud-proof on the source network within the challenge window. Thus, optimistic bridges have a 1 of N security model, which relies on one honest actor watching the system to correctly verify crosschain transactions.

  *Considerations*
  
  * How many agents are employed by the bridge to sign and validate transactions? Is this set of agents centralized? If so, can the agents conduct a Denial-of-Service (DoS) attack by not signing a merkle root? In such cases, will the system halt?
  * What exactly is the bonded stake of agents? Is it a bridge-specific token? What are the dynamics that drive the value of such tokens?
  * What is the cost of bribing or corrupting the agents to violate safety? Is this correlated with the price of a token?
  * Can agents, on their own or due to regulations, censor messages? Can such entities be removed from the set of agents to prevent censorship?
  * How will the liveness of an application be affected if an agent faces downtime? Will the application stop receiving messages?
  * How many actors are watching the network to detect fraudulent transactions?
  * Can anyone monitor the system to detect fraudulent transactions? If not, and the set of actors watching the system is permissioned, does that make the cost of corrupting it known? 
  * Is the optimistic bridge “spam-proof” – meaning can an actor watching the system arbitrarily dispute transactions without penalty? Can such actors permanently halt a communication channel by spamming it?
  * Can anyone watching the system, on their own or due to regulations, censor messages? Can such entities be removed from the set of actors watching the system to prevent censorship?
  * Do the actors watching the system have competing interests with users of the bridge? e.g. trading firms that could benefit from front-running a big volume crosschain transaction or from cross-domain MEV?

A number of protocols employ a hybrid approach to bridging that leverages different approaches for a more robust crosschain solution. For example, Celer Inter-chain Message (Celer IM), utilizes a proof of stake approach by default but offers an optimistic-rollup inspired security model as a fallback solution in the worst-case scenario where validators behave maliciously in the PoS approach. 
