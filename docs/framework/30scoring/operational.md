## Operational Risk Scoring

The following aspects of Operational Risk Scoring are currently not taken into account when assessing the Operational Risk Score: [Operational Security](../20categories/40operation/operational-security.md), [Decentralization of Operations](../20categories/40operation/decentralization.md), [Diversity of Codebase](../20categories/40operation/diversity-code.md), [Off-chain Security](../20categories/40operation/offchain-security.md), and [Vulnerability Response Planning](../20categories/40operation/vulnerability.md).

The equation for the *Operational Risk Score* is:

```
Operational Risk Score = Operational Ability to Pause Score
```

### Operational Ability to Pause Score
The equation for the *Operational Ability to Pause Score* is:
```
Operational Ability to Pause Score = (O001 + O003 + O004) x O005
```


|Question ID  | Question                     |
|-------------|------------------------------|
| O001        | Type of pausing access control:  |
|             | * None: Score 0  |
|             | * Single EOA controls pausing: Score 1 |
|             | * Role Based Access Control with multiple accounts (EOA or contract): Score 5 |
|             | * A multisig wallet controls pausing: Score is answer to Question ID O002. |
| O002        | Multisig Wallets: Is the threshold of the multisig wallet greater than one? Are all signers independent? If either answers is no, the score 0, otherwise score 5. |
| O003        | Automated Pausing: Does the project operate services that monitor the health of the protocol? 
|             | * No: Score 0 |
|             | * Yes: The monitoring service contacts people who can pause the project if unexpected behavior is detected: Score 1.
|             | * Yes: The monitoring service has the ability to pause the protocol if unexpected behavior is detected: Score 2. |
|             | * Yes: The monitoring service contacts people who can pause the project and has the ability to pause the protocol if unexpected behavior is detected: Score 3. |
| O004        | Geographic separation of pausers: Are people who can pause the project spread across time zones? |
|             | * No: Score 0. |
|             | * Across multiple timezones, but not complete coverage: Score 1. |
|             | * Full coverage: Follow the sun support: Score 2. |
| O005        | Shared keys: Are any accounts / private keys used for pausing the protocol shared with multiple people. If yes, score 0. If no, score 1. | 

Rationale for scoring:

* The ideal configuration is Role Based Access Control, with active monitoring and a geographically dispersed support team. For decentralized projects, in addition to the automated monitoring system, pausing could be controlled a multisig wallet behind one or more of the accounts of the Role Based Access Control.
* Shared keys indicates poor security management. This indicates that there may be other poor practices in the system that are not known.