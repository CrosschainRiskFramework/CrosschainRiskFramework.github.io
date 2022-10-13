# Sources of Risk

At its essence, cross-chain protocols create a dependency relationship between networks. This dependency could be uni-directional or bi-directional, transient or persistent. The core security requirement of cross-chain infrastructure is to guarantee two key properties:

 * The correct representation of the state of one network to another in a complete and timely manner.
 * The preservation of the integrity and validity of all state changes in a network that result from the communication of state in another e.g. ensuring any dependency invariants across chains are preserved (e.g. wrapped asset supply matches native asset supply) or events resulting from forks and reorgs of underlying networks.

Broadly, there are four key sources of risk in cross-chain infrastructure:

* Network Consensus Risk: One of the core security assumptions of cross-chain communication is that the state communicated from one network to another is valid according to the consensus rules of the underlying network. Failures in the safety or liveness properties of an underlying network can thus risk creating inconsistent state changes across chains that cannot be reconciled. Such risk is often beyond the control boundary of cross-chain infrastructure and likely represents a fundamental security limitation to bridging across independent sovereign chains. However, risk controls can be enacted to limit the magnitude of such failures (e.g. containing and isolating the impact of failures in any single network).
* Protocol Architecture Risk: At a base level, a cross-chain protocol needs to guarantee two security properties 1) safety, which is that invalid network states are never communicated across chains and 2) liveness, that all cross-chain messages from one chain to another are eventually delivered. The security assumptions and conditions under which the architecture of a protocol guarantees these properties can be a source of significant risk. Architectures that introduce new trusted parties often offer weaker guarantees than those that solely rely on the security of the underlying networks. This category encompasses not just the architecture of base layer messaging protocols, but also the core design assumptions of protocols built atop.  
* Protocol Implementation Risk: Cross-chain protocols are complex systems with various components spanning multiple ecosystems. The implementation of such software and the low-level design decisions towards this end can be a source of risk. This often manifests in the form of software bugs (logic bugs, dependency vulnerabilities, etc.). This has been a predominant cause of the bridge failures experienced over the last couple of years.
* Protocol Operation Risk: The operation of a cross-chain bridge involves the management of various components, potentially by distinct actors. Such activities could include the upgrade and management of bridge smart contracts and the operation of various off-chain systems (e.g. external validator nodes). Having robust, secure, decentralized, and transparent mechanisms, processes, and policies for managing such systems is crucial to ensuring the security of cross-chain bridges.

The following sections review each of these areas of risk in more detail.

TODO: Systematic vs idiosyncratic risk
