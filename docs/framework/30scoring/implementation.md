## Implementation Risk Scoring

The following aspects of [Implementation Risk](../20categories/30implementation/protocol-implementation-risk.md#protocol-implementation-risk) are currently not taken into account when assessing the Implementation Risk Score: 
[Mixing of Control and Data Plane](../20categories/30implementation/mixing-control-data-flow.md), 
[Role Based Access Control](../20categories/30implementation/access-control.md),
[Upgradability](../20categories/30implementation/upgrade.md),
[Secret Storage](../20categories/30implementation/secret-storage.md),
[Product Development Maturity](../20categories/30implementation/maturity.md),
[Well Known Platform](../20categories/30implementation/known-platform.md),
[Well Known Smart Contract Programming Language](../20categories/30implementation/known-language.md),
[Formal Verification](../20categories/30implementation/formal-verification.md),
[Testing](../20categories/30implementation/testing.md),
[Open Source Code](../20categories/30implementation/open-source.md),
[Verified Code on Block Explorer](../20categories/30implementation/verified-code.md),
[Documentation](../20categories/30implementation/documentation.md),
[Bug Bounty](../20categories/30implementation/bug-bounty.md),
[Ability to Pause Project](../20categories/30implementation/pause.md),
and 
[Ability to Ban Addresses](../20categories/30implementation/ban-address.md).


The equation for the *Implementation Risk Score* is:

```
Implementation Risk Score = Code Auditing Score
```

### Code Auditing Score
Code auditing is described in detail in the [Code Auditing](../20categories/30implementation/audit.md) section. The equation for the *Code Auditing Score* is:

```
Code Audit Score = (I011 + I012 + I014 + I015) x I013
```

The *Code Auditing Score* ranges from 0 to 10.


|Question ID  | Question                     |
|-------------|------------------------------|
| I011        | Has any version of the on-chain components of the system been audited? If yes, score 2. If no, score 0. |
| I012        | Has any version of the on-chain components of the system been audited by more than one audit organisation? If yes, score 2. If no, score 0. |
| I013        | For the most recent audit, were all critical issues addressed? If yes, score 1. If no, score 0. |
| I014        | Has the deployed version of the on-chain components of the system been audited? If yes, score 4. If no, score 0. |
| I015        | Has any version of the off-chain components of the system been audited? If yes, score 2. If no, score 0. If the system contains no off-chain components, then score 2. |

Rationale for scoring:

* Unaddressed critical issues could indicate vulnerabilites.
* Having an audit, addressing issues, and then deploying the revised code without re-auditing can result in vulnerabilities.
* The quality of audit firms is not factored in the score as this is very subjective. 

