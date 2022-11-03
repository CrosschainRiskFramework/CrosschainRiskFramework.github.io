# Categories of Risk

Cross-chain protocols are generally complex systems that are exposed to numerous sources of risk. Classifying these risks enables better reasoning about the inherent limits and challenges of protocols and the considerations and mitigations of different risk factors. To this end, this section identifies four key categories of risk in cross-chain communication:

* Network Consensus Risk: One of the core security assumptions of cross-chain communication is that the state communicated from one network to another is valid according to the consensus rules of the underlying network. Failures in the safety or liveness properties of an underlying network can thus risk creating inconsistent state changes across chains that cannot be reconciled. Such risks are often beyond the control boundary of cross-chain infrastructure and likely represent a fundamental security limitation to bridging across independent sovereign chains. The impact of a failure of this type would simultaneously affect all bridges exposed to the underlying faulty network. However, risk controls can be enacted to limit the magnitude of such failures (e.g. containing and isolating the impact of failures in any single network).

* Protocol Architecture Risk: As discussed in the [Introduction](../01intro/introduction.md), cross-chain protocols can be viewed through a layered architecture. The design assumptions and constraints under which protocols at each layer guarantee relevant security properties can be a source of significant risk. For instance, at the messaging layer, architectures that introduce new trusted parties often offer weaker guarantees than those that solely rely on the security of the underlying networks.

* Protocol Implementation Risk: Building cross-chain protocols involves creating complex components (on-chain, off-chain) while accounting for the peculiarities and pitfalls of different programming languages, virtual machines, and runtime environments. Inevitably, such complexity increases the likelihood of bugs and vulnerabilities. This type of risk has thus far been the most common cause of bridge hacks witnessed over the last couple of years.

* Protocol Operation Risk: The operation of a cross-chain bridge involves the management of various components, potentially by distinct actors. Such activities could include the upgrade and management of bridge smart contracts and the operation of various off-chain systems (e.g. external validator nodes). Failures and oversights in these operational activities can present a significant source of risk to protocols. Having robust, secure, decentralized, and transparent mechanisms and processes for managing such systems is crucial to ensuring the security of cross-chain bridges.

The following sections review each of these areas of risk in more detail.


{% include-markdown "10network/network.md" %}
{% include-markdown "20architecture/architecture.md" %}
{% include-markdown "30implementation/protocol-implementation-risk.md" %}
{% include-markdown "40operation/protocol-operation-risk.md" %}
