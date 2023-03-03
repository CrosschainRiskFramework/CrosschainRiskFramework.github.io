### Upgradable
Like any software, smart contracts software can have bugs. This is true of both code that appears to be extremely simple and more complex code. Additionally, applications may require new features. As such, many projects have the ability to upgrade their smart contract code.

Having the ability to upgrade a contract is inherently risky as it can lead to rug-pulling attacks, where the operators of a project change the contract logic and steal customer funds (for instance the [Hunter Defi](https://twitter.com/CertiKAlert/status/1523153063875575809) rug-pull). However, as a proportion of both the number of cypto rug pull attacks and as a proportion of the projects that use upgradable contracts, using contract upgrade as a method of stealing funds is very rare. We have no hard statistics on this; this is just an observation.

Another major source of risk related to upgrading a contract is that vulnerabilities can either be introduced due to the new code, or the interaction of the new code with the old data. This was the source of the issue in the [Nomad hack in August 2022](https://medium.com/nomad-xyz-blog/nomad-bridge-hack-root-cause-analysis-875ad2e5aacd).

An important consideration is the processes and controls that govern contract upgrades. That is, who can perform upgrades, how decentralised is this privilege, are there timelocks such that upgrades take effect at some time after the upgrade is triggered. Many of these governance considerations are covered in the [Role Based Access Control](../30implementation/access-control.md) section.


The three common methodologies for upgrading smart contracts are:

* [Data Holder Upgrade Pattern](https://www.youtube.com/watch?v=VhzafmGGmzo): Have a data holder contract and a separate business logic contract. The business logic contracts are upgraded, and connect to the existing data holder contracts. Issues with this approach are that new versions of the business logic contract need to be able to utilise old data formats stored in the data holder contract.
* [Transparent Upgrade Proxy Pattern](https://docs.openzeppelin.com/upgrades-plugins/1.x/proxies): Have a transparent upgrade proxy contract and a business logic contract. The business logic contract executes in the context of the upgrade proxy contract. The upgrade logic resides in the proxy contract. Issues with this approach are that extreme caution needs to be exercised to ensure there are no storage slot collisions between the proxy and the business logic contracts, and between different versions of the business logic contract.
* Transparent Upgrade Proxy Pattern with Upgradable Upgrade Logic: As per the Transparent Upgrade Proxy Pattern described above, but with the upgrade logic in the business logic contract. The advantage of this approach is that governance that exists in the business logic contract can be used to approve the upgrade. Issues with this approach over and above the issues with the Transparent Upgrade Proxy Pattern approach is that bugs with the business logic contract can interfere with the upgrade logic, thus preventing upgrade, or enabling an attacker to maliciously upgrade the contract.

In summary, having the ability to upgrade the contracts of a project has risks. However, not having the ability to upgrade contracts, thus resolving bugs, has other, possibly larger risks.
