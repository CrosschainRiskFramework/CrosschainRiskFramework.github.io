# Network Consensus Risk
Crosschain protocols enable the coordination of state changes across networks. This typically requires sending state information from a source network to one or more destination networks and performing consequent state changes. A fundamental assumption in this process is that: a) states in the source network are valid and final according to its consensus rules, and b) the underlying network can process all transactions in a timely manner.

From the perspective of risk in crosschain protocols, there are at least three considerations relating to these assumptions:

1. Protocols should only communicate states that have been finalized in the source network
1. Protocol security should be resilient to network liveness failures
1. Protocols should mitigate the impact of network safety violations

#### Transaction Finality
A transaction that is irrevocably included in a ledger is considered _final_. What this means, in practice, is that reverting such a transaction would incur significant economic costs to a majority of validators, as to be considered highly improbable. How finality is achieved varies across networks and can either be _probabilistic_ or _deterministic_. Networks with _deterministic_ finality offer definite assurance about the permanence of the state of a network after some time. In contrast, probabilistic models offer only degrees of confidence, with increasing assurance attained over time. For _deterministic_ models, finality could be instantly achieved after a single block or eventually after several blocks. 

Networks with slower finality times increase latency in crosschain communication, which impacts the customer experience. However, crosschain protocols must ensure that strong assurances about the finality of a given state are achieved before relaying it across chains. Crosschain protocols, which optimize for performance and relay information prematurely, risk creating inconsistencies across networks and the possible loss of a party's funds.

#### Network Delays and Liveness Failures
Some crosschain protocols rely considerably on the underlying networks processing transactions within a given period. For instance, protocols might assume that fraud proofs can be delivered within a time window. Such protocols must account for aberrations in transaction latency caused by network congestions and delays. Moreover, some consensus protocols trade-off liveness for safety under certain conditions, halting for extended periods if a portion of their validators are offline or unreachable. 

#### Network Safety Violations
A fundamental problem for crosschain protocols connecting sovereign networks is a scenario in which a network experiences a significant state reversion. This could result from active network attacks (e.g., [51% attack](https://www.coindesk.com/learn/what-is-a-51-attack/)), hard forks, or bugs in protocol implementations. The likelihood of such failures is higher in chains with fewer validators, lower economic security, or new consensus protocols. 

Such risks are often beyond the control boundary of crosschain infrastructure and affect all crosschain protocols connected to a network simultaneously. Hence, for crosschain protocols spanning independent networks, this likely represents a [fundamental security limitation](https://old.reddit.com/r/ethereum/comments/rwojtk/ama_we_are_the_efs_research_team_pt_7_07_january/hrngyk8/) to the security guarantees that such protocols can offer. 

However, crosschain protocols can reduce the impact of such failure in one network by limiting its contagion to other chains. If a consensus failure in one network can cascade to affect all other chains, then the security of a bridge is dependent on its weakest link. Additionally, crosschain protocol builders should conduct adequate due diligence on the security and decentralisation properties of the networks they integrate.
