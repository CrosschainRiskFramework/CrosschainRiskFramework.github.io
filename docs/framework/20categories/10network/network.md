## Network Consensus Risk
Cross-chain protocols enable the coordination of state changes across networks. This typically requires sending state information from a source network to one or more destination networks and performing consequent state changes. A fundamental assumption in this process is that: a) states in the source network are valid and final according to its consensus rules, and b) the underlying network can process all transactions in a timely manner.

From the perspective of risk in cross-chain protocols, there are at least three considerations relating to these assumptions:
1. Protocols should only communicate states that have been finalized in the source network
1. Protocol security should be resilient to network liveness failures
1. Protocols should mitigate the impact of network safety violations

#### Transaction Finality
Finality models vary significantly across networks. They could be _probabilistic_ or _deterministic_, _instant_ or _eventual_. Networks with _deterministic_ finality offer absolute assurance about the state of a network after some time. In contrast, probabilistic models offer only degrees of confidence, with more crypto-economic assurance achieved over time. For _deterministic_ models, finality could be instantly achieved after a single block or eventually after several blocks. Networks with slower finality times increase latency in cross-chain communication, which impacts the customer experience. However, cross-chain protocols must ensure that the finality of a given state is achieved before relaying the state across chains. Cross-chain protocols, which optimize for performance and relay information across chains without sufficiently waiting for finality, risk creating inconsistencies across networks and the possible loss of user funds.

#### Network Liveness Failures
Some cross-chain protocols rely considerably on the underlying networks processing transactions within a given period. For instance, protocols might assume cross-chain messages or fraud proofs will be submitted within a period. Because some consensus protocols explicitly trade off liveness for safety under certain conditions, cross-chain protocols must account for these conditions.

#### Network Safety Violations
A more fundamental and systematic problem for cross-chain protocols across sovereign networks is if the ledger of the underlying network undergoes significant reorganizations and reversions. This could result from active network attacks (e.g., 51% attack), hard forks, or bugs in protocol implementations. The likelihood of such failures is higher in chains with fewer validators, lower economic security, or new consensus protocols. Such risks are often beyond the control boundary of cross-chain infrastructure and affect all cross-chain protocols connected to a network simultaneously.

For cross-chain protocols spanning independent networks, this likely represents a [fundamental security limitation](https://old.reddit.com/r/ethereum/comments/rwojtk/ama_we_are_the_efs_research_team_pt_7_07_january/hrngyk8/) to the security guarantees that such protocols can offer. However, cross-chain protocols can reduce the impact of such failure by limiting contagion to other chains. If a consensus failure in one network can cascade to affect all other chains, then the security of a bridge is dependent on its weakest link.
