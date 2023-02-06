## Operational Risk Scoring

The following aspects of Operational Risk are currently not taken into account when assessing the Operational Risk Score: [Decentralization of Operations](../20categories/40operation/decentralization.md#decentralization-of-operations), [Diversity of Codebase](../20categories/40operation/diversity-code.md#codebase-diversity), and [Off-chain Security](../20categories/40operation/offchain-security.md#security-of-off-chain-systems).

The equation for the *Operational Risk Score* is:

```
Operational Risk Score = Operational Security Score x Operational Ability to Pause Score x Vulnerability Response Planning Score / 100
```

### Operational Security Score
Operational Security is defined by the ability to meet the properties defined in the [Operational Security](../20categories/40operation/operational-security.md#operational-security) section. The equation for the *Operational Security Score* is:

```
Operational Security Score = 5 + O001 + O002 + O003
```

The *Operational Security Score* ranges from 0 to 10.


|Question ID  | Question                     |
|-------------|------------------------------|
| O001        | Has sensitive information as defined in the [Operational Security](../20categories/40operation/operational-security.md#operational-security) section been identified? Has this information been documented? If yes, score 1. If no, score 0. |
| O002        | Is a complete Operational Security process, as described in the [Operational Security](../20categories/40operation/operational-security.md#operational-security) section implemented? If yes, score 1. If no, score 0. |
| O003        | Is there a bug bounty for the project?  How big is the bug bounty? <ul><li>There is no bug bounty: Score 0.</li><li>Less than US$10,000: Score 1.</li><li>US$10,000 but less than US$100,000: Score 2.</li><li>More than US$100,000: Score 3.</li></ul> |

Rationale for scoring:

* The constant **5** is added to the elements of the Operational Security Score. This is because Operational Security offers incremental improvement in the security of a system, and is not as fundamental as other aspects of a project.




### Operational Ability to Pause Score
The Operational Ability to Pause is defined by the ability to meet the properties defined in the [Operational Ability to Pause](../20categories/40operation/ability-pause.md#ability-to-pause) section. The equation for the *Operational Ability to Pause Score* is:

```
Operational Ability to Pause Score = (O101 + O103 + O104) x O105
```

The *Operational Ability to Pause Score* ranges from 0 to 10.

|Question ID  | Question                     |
|-------------|------------------------------|
| O101        | Type of pausing access control: <ul><li>None: Score 0.</li><li>Single EOA controls pausing: Score 1.</li><li>Role Based Access Control with multiple accounts (EOA or contract): Score 5.</li><li>A multisig wallet controls pausing: Score is answer to Question ID O102.</li></ul> |
| O102        | Multisig Wallets: Is the threshold of the multisig wallet greater than one? Are all signers independent? If either answers is no, the score 0, otherwise score 5. |
| O103        | Automated Pausing: Does the project operate services that monitor the health of the protocol? <ul><li>No: Score 0.</li><li>Yes: The monitoring service contacts people who can pause the project if unexpected behavior is detected: Score 1.</li><li>Yes: The monitoring service has the ability to pause the protocol if unexpected behavior is detected: Score 2.</li><li>Yes: The monitoring service contacts people who can pause the project and has the ability to pause the protocol if unexpected behavior is detected: Score 3.</li></ul> |
| O104        | Geographic separation of pausers: Are people who can pause the project spread across time zones? <ul><li>No: Score 0.</li><li>Across multiple timezones, but not complete coverage: Score 1.</li><li>Full coverage: Follow the sun support: Score 2.</li></ul> |
| O105        | Shared keys: Are any accounts / private keys used for pausing the protocol shared with multiple people. If yes, score 0. If no, score 1. | 

Rationale for scoring:

* The ideal configuration is Role Based Access Control, with active monitoring and a geographically dispersed support team. For decentralized projects, in addition to the automated monitoring system, pausing could be controlled a multisig wallet behind one or more of the accounts of the Role Based Access Control.
* Shared keys indicates poor security management. This indicates that there may be other poor practices in the system that are not known.




### Vulnerability Response Planning Score
Vulnerability Response Planning is defined by the ability to meet the properties defined in the 
[Vulnerability Response Planning](../20categories/40operation/vulnerability.md#vulnerability-response-plan) section. The equation for the *Vulnerability Response Planning Score* is:

```
Vulnerability Response Planning Score = O501 + O502 + O503 + O504
```

The *Vulnerability Response Planning Score* ranges from 0 to 10.


|Question ID  | Question                     |
|-------------|------------------------------|
| O501        | Is there a defined *Vulnerability Response Virtual Team*? If yes, score 1, otherwise score 0. |
| O502        | Is there a vulnerability reporting mechanism that allows issues to be reported without making them public? If yes, score 3, otherwise score 0. |
| O503        | Is there a defined triage process for vulnerabilities?  If yes, score 1, otherwise score 0. |
| O504        | Can vulnerabilities fixes be deployed without needing to put code into a public repository? If yes, score 4, otherwise score 0. |
| O505        | Are *Root Cause Analyses* published? If yes, score 1, otherwise score 0. |


Rationale for scoring:

* It is important that vulnerabilities can be reported, and then vulnerability fixes worked on, and then deployed without having to make them public. 


