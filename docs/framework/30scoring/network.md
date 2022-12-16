## Network Consensus Risk Scoring

The equation for the *Network Consensus Risk Score* is:

```
Network Consensus Risk Score = (N001 + N002 + N003 + N004) x 10 / 17
```


|Question ID  | Question                     |
|-------------|------------------------------|
| N001        | [Finality](../20categories/10network/network.md#transaction-finality): Does the crosschain protocol wait for transactions to be final on the source chain prior to acting upon them?
|             | * Transactions are final: Score 5. |
|             | * Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000,000,000: Score 5. |
|             | * Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000,000: Score 3. |
|             | * Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of greater than one in 1,000,000: Score 2. |
|             | * Transactions are probably final, assuming the maximum sized attack possible with US$100M rented hardware, with a probability of less than one in 1,000,000: Score 0. |
| N002        | [Network Delays and Liveness](../20categories/10network/network.md#network-delays-and-liveness-failures) Reliability: Has the source chain been offline (excluding planned network upgrades)? |
|             | * Never: Score 5.                  |
|             | * Once in the past year for an hour or less: Score 3. |
|             | * More than once in the past year or just once but for longer than an hour: Score 0. |
| N003        | [Network Delays and Liveness](../20categories/10network/network.md#network-delays-and-liveness-failures) Congestion: Has the source chain been congested such that transactions can not be submitted and included in the blocchain? |
|             | * Never: Score 2.                  |
|             | * Once in the past year for an hour or less: Score 1. |
|             | * More than once in the past year or just once but for longer than an hour: Score 0. |
| N004        | [Network Safety Violations](../20categories/10network/network.md#network-safety-violations): Has the source chain had any safety violations?
|             | * Never: Score 5.                  |
|             | * Once in the past year: Score 1. |
|             | * More than once in the past year: Score 0. |

Rationale for scoring:

* The ideal configuration is a protocol that only uses information based on transaction that are final on the source chain, and the source chain has never has any liveness or safety issues.

