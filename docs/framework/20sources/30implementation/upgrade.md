### Upgradable
TODO: This needs some thought.

Upgrading can lead to rug-pulling, possibly by attackers who gain access to the address with upgrade privileges.
However, code often has bugs. Additionally, new features can be added. Hence, the ability to upgrade is important.
Are different upgrade mechanisms more and less risky?

Transparent proxy

Poor implementation where storage slots are mistakenly re-used has led to vulnerabilities.
Deploy new contract and point front end at new contract.
Non-transparent proxy with separate data contract.

