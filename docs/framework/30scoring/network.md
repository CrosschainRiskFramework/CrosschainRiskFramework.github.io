## Network Consensus Risk Scoring
The Network Consensus Risk Score assesses the risk posed by the [Network Consensus](../20categories/10network/network.md#network-consensus-risk) properties of the blockchains being bridged.

The equation for the *Network Consensus Risk Score* is:

```
Network Consensus Risk Score = Lowest of (Temp Network Consensus Risk Score, 100)
Temp Network Consensus Risk Score = N001 + N002 + N003 + N004 + N005 + N006 + N007
```


|Question ID  | Question                     |
|-------------|------------------------------|
| N001        | [Finality](../20categories/10network/network.md#transaction-finality): Does the crosschain protocol wait for transactions to be final on the source chain prior to acting upon them? <ul><li> Transactions are final: Score 0. </li><li>Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000,000,000: Score 0.</li><li>Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000,000: Score 10. </li><li>Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000: Score 30.</li><li>Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of less than one in 1,000,000: Score 70.</li></ul> |
| N002        | [Source Chain Outages (Network Delays and Liveness)](../20categories/10network/network.md#network-delays-and-liveness-failures) Reliability: Has the source chain been offline? <ul><li>Never: Score 0.</li><li>Once in the past year for an hour or less: Score 5.</li><li>More than once in the past year, but each time for less than an hour: Score 20.</li><li>Longer than an hour in any one outage in the last year: Score 30.</li></ul> |
| N003        | [Source Chain Congestion (Network Delays and Liveness)](../20categories/10network/network.md#network-delays-and-liveness-failures) Congestion: Has the source chain been congested such that transactions can not be submitted and included in the blockchain? <ul><li>Never: Score 0.</li><li>Once in the past year for an hour or less: Score 5.</li><li>More than once in the past year, but each time less than an hour: Score 10.</li><li>Longer than an hour of congestions in any one event in the last year: Score 30.</li></ul>
| N004        | [Source Chain Network Safety Violations](../20categories/10network/network.md#network-safety-violations): Has the source chain had any safety violations? <ul><li>Never: Score 0.</li><li>Once in the past year: Score 50.</li><li>More than once in the past year: Score 70.</li></ul> |
| N005        | [Target Chain Outages (Network Delays and Liveness)](../20categories/10network/network.md#network-delays-and-liveness-failures) Reliability: Has the target chain been offline? <ul><li>Never: Score 0.</li><li>Once in the past year for an hour or less: Score 5.</li><li>More than once in the past year, but each time for less than an hour: Score 20.</li><li>Longer than an hour in any one outage in the last year: Score 30.</li></ul> |
| N006        | [Target Chain Congestion (Network Delays and Liveness)](../20categories/10network/network.md#network-delays-and-liveness-failures) Congestion: Has the target chain been congested such that transactions can not be submitted and included in the blockchain? <ul><li>Never: Score 0.</li><li>Once in the past year for an hour or less: Score 5.</li><li>More than once in the past year, but each time less than an hour: Score 10.</li><li>Longer than an hour of congestions in any one event in the last year: Score 30.</li></ul>
| N007        | [Target Chain Network Safety Violations](../20categories/10network/network.md#network-safety-violations): Has the target chain had any safety violations? <ul><li>Never: Score 0.</li><li>Once in the past year: Score 50.</li><li>More than once in the past year: Score 70.</li></ul> |



Rationale for scoring:

* The ideal configuration is a protocol that only uses information based on transaction that are final on the source chain, and the source chain has never has any liveness or safety issues, and that the crosschain protocol communicates with target chains that have similarly good security properties.

