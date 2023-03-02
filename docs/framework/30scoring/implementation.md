## Implementation Risk Scoring
Implementation Risk Scoring is based on the [Implementation Risk](../20categories/30implementation/protocol-implementation-risk.md#protocol-implementation-risk) section.

The equation for the *Implementation Risk Score* is:

```
Implementation Risk Score = Maximum of (Reducing Implementation Risk Score, Uncovering Extant Risk Score, and Responding to Materialized Risk Score)
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
* There is no Role Based Access Control, but a threshold number of signers need to approve administrative actions: Score 5.



#### Upgradable Risk Score
Upgradable Risk is decribed in the [Upgradability](../20categories/30implementation/upgrade.md) section.

This is currently not accounted for and should be scored as 0.

#### Secret Storage Risk Score
Secret Storage is described in the [Secret Storage](../20categories/30implementation/secret-storage.md) section.

This is currently not accounted for and should be scored as 0.

#### Product Development Maturity Risk Score
Product Development Maturity is described in the [Product Development Maturity](../20categories/30implementation/maturity.md) section.


This is currently not accounted for and should be scored as 0.

#### Well Known Platform Risk Score
The risks associated with not using Well Known Platforms is contained in the [Well Known Platform](../20categories/30implementation/known-platform.md) section.

This is currently not accounted for and should be scored as 0.


#### Well Known Smart Contract Programming Language Risk Score
The risks associated with not using a Well Known Smart Contract Programming Language is contained in the [Well Known Smart Contract Programming Language](../20categories/30implementation/known-language.md) section. The Well Known Smart Contract Programming Language Risk Score is specific to a bridge between two chains. That is, a bridge system could be between a dozen chains. The score could be different for each source chain - target chain combination. The Well Known Smart Contract Programming Language Risk Score is calculated as:

```
Well Known Smart Contract Programming Language Risk Score = I700 + I701
```

|Question ID  | Question                     |
|-------------|------------------------------|
| I701        | Are bridge contracts on either chain the bridge connects written in a language other than Solidity? If yes score 20, otherwise score 0. |
| I702        | With the exception of well known libraries (such as OpenZeppelin), do the bridge contracts contain any assembler code? If yes, score 5, otherwise score 0. |




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
The risks associated with not thoroughly testing an application are described in the [Testing](../20categories/30implementation/testing.md) section.

This is currently not accounted for and should be scored as 0.


#### Code Auditing Score
Code auditing is described in detail in the [Code Auditing](../20categories/30implementation/audit.md) section. The equation for the *Code Auditing Score* is:

```
Code Audit Score = I1011 + I1012 + I1014 + I1015 + I1013
```

The *Code Auditing Score* ranges from 0 to 20.


|Question ID  | Question                     |
|-------------|------------------------------|
| I1011        | Has any version of the on-chain components of the system been audited? If yes, score 0. If no, score 2. |
| I1012        | Has any version of the on-chain components of the system been audited by more than one audit organisation? If yes, score 0. If no, score 2. |
| I1013        | For the most recent audit, were all critical issues addressed? If yes, score 0. If no, score 10. |
| I1014        | Has the deployed version of the on-chain components of the system been audited? If yes, score 0. If no, score 4. |
| I1015        | Has any version of the off-chain components of the system been audited? If yes, score 0. If no, score 2. If the system contains no off-chain components, then score 0. |

Rationale for scoring:

* Unaddressed critical issues could indicate vulnerabilites.
* Having an audit, addressing issues, and then deploying the revised code without re-auditing can result in vulnerabilities.
* The quality of audit firms is not factored in the score as this is very subjective. 



#### Open Source Code Risk Score
The risks of not using open source code for a project are discussed in the [Open Source Code](../20categories/30implementation/open-source.md) section.


This is currently not accounted for and should be scored as 0.

#### Verified Code on Block Explorer Risk Score
The risks associated with not publishing code to blockchain explorers is covered in the 
[Verified Code on Block Explorer](../20categories/30implementation/verified-code.md) section.


This is currently not accounted for and should be scored as 0.


#### Documentation Risk Score
The risks associated with not documenting a project well are discussed in the [Documentation](../20categories/30implementation/documentation.md) section.

This is currently not accounted for and should be scored as 0.


#### Bug Bounty Risk Score
Bug Bounties are described in detail in the [Bug Bounty](../20categories/30implementation/bug-bounty.md) section. The equation for the *Bug Bounty Score* is:

```
Bug Bounty Score = I1401
```


|Question ID  | Question                     |
|-------------|------------------------------|
| I1401        | Is there a bug bounty for the project?  How big is the bug bounty? <ul><li>There is no bug bounty: Score 10.</li><li>Less than US$10,000: Score 5.</li><li>US$10,000 but less than US$100,000: Score 2.</li><li>More than US$100,000: Score 0.</li></ul> |



### Responding to Materialized Risk Score
```
Responding to Materialized Risk Score = 
 Ability to Pause Risk Score + 
 Ability to Ban Addresses Risk Score
```

#### Ability to Pause Risk Score
The ability to pause a project is described in the [Ability to Pause Project](../20categories/30implementation/pause.md) section.


This is currently not accounted for and should be scored as 0.


#### Ability to Ban Addresses Risk Score
The ability to ban specific addresses is described in the [Ability to Ban Addresses](../20categories/30implementation/ban-address.md) section. This capability is in contrast to the censorship resistance property that is of utmost importance to many protocols. So as to not downrank protocols that strive to provide censorship resistance over protocols that provide the ability to ban addresses, the ability to ban addresses is not scored. As such, the Ability to Ban Addresses Risk Score is always 0.






