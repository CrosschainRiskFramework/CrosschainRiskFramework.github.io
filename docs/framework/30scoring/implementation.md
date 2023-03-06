## Implementation Risk Scoring
Implementation Risk Scoring is based on the [Implementation Risk](../20categories/30implementation/protocol-implementation-risk.md#protocol-implementation-risk) section.

The equation for the *Implementation Risk Score* is:

```
Implementation Risk Score = Lowest of (Temp Implementation Risk Score, 100)
Temp Implementation Risk Score = Maximum of (Reducing Implementation Risk Score, Uncovering Extant Risk Score, and Responding to Materialized Risk Score)
```

### Reducing Implementation Risk
```
Reducing Implementation Risk Score = 
 Mixing of Control and Data Plane Risk Score +
 Role Based Access Control Risk Score +
 Upgradable Risk Score +
 Secret Storage Risk Score +
 Product Development Maturity Risk Score +
 Well Known Platform Risk Score +
 Well Known Smart Contract Programming Language Risk Score
```

#### Mixing of Control and Data Plane Risk Score
Mixing of Control and Data Plane is described in the 
[Mixing of Control and Data Plane](../20categories/30implementation/mixing-control-data-flow.md) section. If the Control and Data Plane are mixed, then the Mixing of Control and Data Plane Risk Score is 20, or 0 otherwise.

The Control and Data Plane are considered mixed if the answer to any of the following questions is yes:

* Can Control Plane functions be called from Data Plane functions without some additional authentication checks?
* If Control Plane messages are sent across the crosschain communications channel, are Control Plane messages signed by the same keys as Data Plane messages?


#### Role Based Access Control Risk Score
Role Based Access Control is described in the [Role Based Access Control](../20categories/30implementation/access-control.md) section.

The Role Based Access Control Risk Score depends on the permissioned control / ownership of the bridge contracts. If there are multiple contracts, and they  are configured differently, then score the highest score.

* There is no permissioned ownership feature: Score 0.
* There a single EOA as the owner: Score 10.
* Role Based Access Control has been implemented: Score 0.
* There is no Role Based Access Control, but a threshold number of signers need to approve administrative actions. If number of signers is five or more score 3, otherwise score 5. Additionally, if the number of signers that need to sign is more than 50%, score 0, otherwise score 5.



#### Upgradable Risk Score
Upgradable Risk is decribed in the [Upgradability](../20categories/30implementation/upgrade.md) section.

The risks associated with being able to upgrade contracts appear to be similar to the risks associated with not being able to upgrade a contract. As such, the Upgradable Risk Score is always 0.


#### Secret Storage Risk Score
Secret Storage is described in the [Secret Storage](../20categories/30implementation/secret-storage.md) section. The *Secret Storage Risk Score* is defined by the equation below.

```
Secret Storage Risk Score = I401
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I401        | Are any private keys, symmetric keys, passwords, or passcodes used in the project stored on disk in a plain text file? If yes, score 20, if no score 0. |


#### Product Development Maturity Risk Score
Product Development Maturity is described in the [Product Development Maturity](../20categories/30implementation/maturity.md) section. The *Product Development Maturity Risk Score* is defined by the equation below.

```
Product Development Maturity Risk Score = I501
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I501        | Does the organisation building the project have a documented SDLC approach? If yes, score 0, if no score 20. |


#### Well Known Platform Risk Score
The risks associated with not using Well Known Platforms is contained in the [Well Known Platform](../20categories/30implementation/known-platform.md) section.

Scoring of this category has proven to be controvertial. At present, the risk score for this category is 0.


#### Well Known Smart Contract Programming Language Risk Score
The risks associated with not using a Well Known Smart Contract Programming Language is contained in the [Well Known Smart Contract Programming Language](../20categories/30implementation/known-language.md) section. 

Scoring of this category has proven to be controvertial. At present, the risk score for this category is 0.



### Uncovering Extant Risk Score
```
Uncovering Extant Risk Score = 
 Formal Verification Risk Score +
 Test Risk Score +
 Code Auditing Risk Score + 
 Open Source Code Risk Score +
 Verified Code on Block Explorer Risk Score +
 Documentation Risk Score +
 Bug Bounty Risk Score 
```

#### Formal Verification Risk Score
The risks of not formally verifying code is contained in the [Formal Verification](../20categories/30implementation/formal-verification.md) section.

The Formal Verification Risk Score is 5 if the code has not been formally verified, and 0 if it has been formally verified.


#### Test Risk Score
The risks associated with not thoroughly testing an application are described in the [Testing](../20categories/30implementation/testing.md) section. The *Test Risk Score* is defined by the equation below.

```
Test Risk Score = I901 + I902 + I903 + I904 + I905 + I906 
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I901        | Is there a test plan documenting which tests scenarios should be tested? If yes, score 0, if no score 10. |
| I902        | Are contracts unit tested? If yes, score 0, if no score 10. |
| I903        | Are their system tests that check the operation of the entire system? If yes, score 0, if no score 10. |
| I904        | Is their a continuous integration system that executes unit and system tests automatically on commit to a source code respository? If yes, score 0, if no score 10. |
| I905        | Are any of the tests executed by the continuous integration system unreliable (that is, some times unexpectedly fail)? If yes, score 5, if no score 0. |
| I906        | Can a product release occur if any test is failing? If yes, score 10, if no score 0. |


#### Code Auditing Risk Score
Code auditing is described in detail in the [Code Auditing](../20categories/30implementation/audit.md) section. The equation for the *Code Auditing Risk Score* is:

```
Code Audit Risk Score = I1011 + I1012 + I1014 + I1015 + I1013
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1011        | How many times has the on-chain components of the system been audited? If none, score 50, and score 0 for questions I1012, I1013, and I1014. If once score 10, if twice or more score 0. |
| I1012        | Has any version of the on-chain components of the system been audited by more than one audit organisation? If yes, score 0. If no, score 5. |
| I1013        | For the most recent audit, were all critical issues addressed? If yes, score 0. If no, score 10. |
| I1014        | Has the deployed version of the on-chain components of the system been audited? If yes, score 0. If no, score 20. |
| I1015        | Has any version of the off-chain components of the system been audited? If yes, score 0. If no, score 20. If the system contains no off-chain components, then score 0. |

Rationale for scoring:

* Unaddressed critical issues could indicate vulnerabilites.
* Having an audit, addressing issues, and then deploying the revised code without re-auditing can result in vulnerabilities.
* The quality of audit firms is not factored in the score as this is very subjective. 



#### Open Source Code Risk Score
The risks of not using open source code for a project are discussed in the [Open Source Code](../20categories/30implementation/open-source.md) section. The equation for the *Open Source Code Risk Score* is:

```
Open Source Code Risk Score = I1101 + I1102
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1101       | Is the source code of the project in a public code respository? If yes, score 0, otherwise score 10. |
| I1102       | Is it possible to develop code and deploy the project from a private repository? That is, can vulnerability fixes be resolved without publishing on the public code repsotory? If yes, score 0, otherwise score 20. |


#### Verified Code on Block Explorer Risk Score
The risks associated with not publishing code to blockchain explorers is covered in the 
[Verified Code on Block Explorer](../20categories/30implementation/verified-code.md) section. The equation for the *Verified Code on Blockchain Explorer Risk Score* is:

```
Verified Code on Block Explorer Risk Score = I1201
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1201       | Do all deployed contracts have verified code uploaded to block explorers? If yes, score 0, otherwise score 50. |


#### Documentation Risk Score
The risks associated with not documenting a project well are discussed in the [Documentation](../20categories/30implementation/documentation.md) section. The equation for the *Documentation Risk Score* is:

```
Documentation Risk Score = I1301 + I1302 + I1303 + I1304 + I1305 + I1306
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1301       | Does the project have architectural documentation? If yes, score 0, otherwise score 5. |
| I1302       | Does the project have a documented threat model? If yes, score 0, otherwise score 5. |
| I1303       | Does the project have sequence diagrams for all major data flows? If yes, score 0, otherwise score 5. |
| I1304       | Are there code comments in smart contract code? If yes, score 0, otherwise score 20. |
| I1305       | Are there code comments in the off-chain code? If yes, score 0, otherwise score 5. |
| I1306       | Are there code comments in the test code? If yes, score 0, otherwise score 5. |


#### Bug Bounty Risk Score
Bug Bounties are described in detail in the [Bug Bounty](../20categories/30implementation/bug-bounty.md) section. The equation for the *Bug Bounty Risk Score* is:

```
Bug Bounty Risk Score = I1401
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1401        | Is there a bug bounty for the project?  How big is the bug bounty? <ul><li>There is no bug bounty: Score 15.</li><li>Less than US$10,000: Score 5.</li><li>US$10,000 but less than US$100,000: Score 2.</li><li>More than US$100,000: Score 0.</li></ul> |



### Responding to Materialized Risk Score
```
Responding to Materialized Risk Score = 
 Ability to Pause Risk Score + 
 Ability to Ban Addresses Risk Score
```

#### Ability to Pause Risk Score
The ability to pause a project is described in the [Ability to Pause Project](../20categories/30implementation/pause.md) section. The equation for the *Ability to Pause Risk Score* is:

```
Ability to Pause Score = I1501
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I1501       | Can all data plane code paths be paused? If yes score 0, otherwise score 20. |


#### Ability to Ban Addresses Risk Score
The ability to ban specific addresses is described in the [Ability to Ban Addresses](../20categories/30implementation/ban-address.md) section. This capability is in contrast to the censorship resistance property that is of utmost importance to many protocols. So as to not downrank protocols that strive to provide censorship resistance over protocols that provide the ability to ban addresses, the ability to ban addresses is not scored. As such, the Ability to Ban Addresses Risk Score is always 0.






