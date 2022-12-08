### Ability to Pause
The pausing capability described in the [Ability to Pause Implementation Risk section](../30implementation/pause.md)
is only effective if the ```pause()``` function can be executed expeditiously. Typically, attacks on protocols are mounted in time periods ranging from minutes to hours. As such, pausing a project several hours after an attack has commenced 
is unlikely to be effective, as by this time, the project may have already been drained of funds.

To prevent malicious parties unnecessarily halting the project by calling the ```pause()``` function, ```pause()``` functions need to have some form of [access control](../30implementation/access-control.md). 

For projects operated by a single organization, a simple administration set-up could be used. However, as described below, this has serious issues. For example, a single administrator account (that is an *owner* account) could be the only party authorized to call the ```pause()``` function. However, to be responsive to the need to pause the project, the private key belonging to the administrator account would need to be shared with support staff who live in timezones around the world. The issue with sharing a single private key is that it would be impossible to determine which support staff member used the key to pause the project. Additionally, if one of the support staff left the company or were compromised, then the shared key would need to be changed.

A better approach to using a shared key is to provide each support staff member with their own administrator account, and provide all accounts with the *Pauser Role*. The advantage of this approach over using a shared key is that the account that pauses the project can be associated with a specific support staff member. Additionally, if one of the support staff left the company or were compromised, then only their account would need to be disabled. This would allow the other support staff to operate without changing their keys.

For projects that are operated by multiple organizations the pausing capability should be controlled by a [multi-signature wallet](https://medium.com/gauntlet-networks/multisig-transactions-with-gnosis-safe-f5dbe67c1c2d). Multi-signature wallets have a threshold number of owners that must vote for a proposed transaction. In the case of pausing, the proposed transaction would be to call the ```pause()``` function. Within the application contract, the multi-signature wallet contract would be authorized to call the ```pause()``` function.

Many projects also incorporate services that monitor the operation of the project. The services could be authorized to call the ```pause()``` function automatically based on the detection of anomalous conditions. This automatic pausing capability needs to operate in parallel with the other manual approaches described above.

The pausing operations described above typically are performed by [Bridge Operators](../../01intro/introduction.md#bridge-operators). Granting [Bridge Validators](../../01intro/introduction.md#bridge-validators) the right to pause bridges has merit as the validators role is to verify state updates. They are likely to be able to detect anomalous behavior. 

Things to consider when setting up a multi-signature wallet and the threshold, are:

* How timezone dispersed the owners are. If they are mostly located in the one timezone region, then pausing will be difficult if an attack is mounted when most are asleep. The threshold for pausing could be lowered to match the number of owners in various timezones across the world. In this way, the project to be paused even if the time an attack is mounted is when most owners are asleep.
* How engaged are the owners. Owners who are volunteers may not be as responsive as is needed to pause a project expeditiously.
* If the threshold is too low, then perhaps a subset of owners who are not happy with the project's direction could choose to disrupt the project by pausing the project.
* How independent are the owners? If multiple owners rely on a single party to hold or operate their keys, then that party effectively has multiple votes.
* Attackers could target owners, aiming to gain access to their key. They could pause the project if they can gain access to the threshold number of keys.

