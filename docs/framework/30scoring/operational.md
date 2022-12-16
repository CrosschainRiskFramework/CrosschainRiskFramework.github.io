## Operational Risk Scoring

The following aspects of Operational Risk Scoring are currently not taken into account when assessing the Operational Risk Score: [Operational Security](../20categories/40operation/operational-security.md#operational-security), [Decentralization of Operations](../20categories/40operation/decentralization.md#decentralization-of-operations), [Diversity of Codebase](../20categories/40operation/diversity-code.md#codebase-diversity), [Off-chain Security](../20categories/40operation/offchain-security.md#security-of-off-chain-systems), and [Vulnerability Response Planning](../20categories/40operation/vulnerability.md#vulnerability-response-plan).

The equation for the *Operational Risk Score* is:

```
Operational Risk Score = Operational Ability to Pause Score
```

### Operational Ability to Pause Score
The Operational Ability to Pause is defined by the ability to meet the properties defined in the [Operational Ability to Pause](../20categories/40operation/ability-pause.md#ability-to-pause) section. The equation for the *Operational Ability to Pause Score* is:

```
Operational Ability to Pause Score = (O001 + O003 + O004) x O005
```


|Question ID  | Question                     |
|-------------|------------------------------|
| O001        | Type of pausing access control: <ul><li>None: Score 0.</li><li>Single EOA controls pausing: Score 1.</li><li>Role Based Access Control with multiple accounts (EOA or contract): Score 5.</li><li>A multisig wallet controls pausing: Score is answer to Question ID O002.</li></ul> |
| O002        | Multisig Wallets: Is the threshold of the multisig wallet greater than one? Are all signers independent? If either answers is no, the score 0, otherwise score 5. |
| O003        | Automated Pausing: Does the project operate services that monitor the health of the protocol? <ul><li>No: Score 0.</li><li>Yes: The monitoring service contacts people who can pause the project if unexpected behavior is detected: Score 1.</li><li>Yes: The monitoring service has the ability to pause the protocol if unexpected behavior is detected: Score 2.</li><li>Yes: The monitoring service contacts people who can pause the project and has the ability to pause the protocol if unexpected behavior is detected: Score 3.</li></ul> |
| O004        | Geographic separation of pausers: Are people who can pause the project spread across time zones? <ul><li>No: Score 0.</li><li>Across multiple timezones, but not complete coverage: Score 1.</li><li>Full coverage: Follow the sun support: Score 2.</li></ul> |
| O005        | Shared keys: Are any accounts / private keys used for pausing the protocol shared with multiple people. If yes, score 0. If no, score 1. | 

Rationale for scoring:

* The ideal configuration is Role Based Access Control, with active monitoring and a geographically dispersed support team. For decentralized projects, in addition to the automated monitoring system, pausing could be controlled a multisig wallet behind one or more of the accounts of the Role Based Access Control.
* Shared keys indicates poor security management. This indicates that there may be other poor practices in the system that are not known.