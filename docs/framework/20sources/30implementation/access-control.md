### Role Based Access Control
[Role Based Access Control (RBAC)](https://en.wikipedia.org/wiki/Role-based_access_control) 
allows different entites to be responsible for different configuration actions. 
Systems that are managed by a single entity are inherently less secure 
than those with narrowly-scoped privileges for different entities and specific contexts.

With 
contracts, this can be used to limit which accounts can execute which functions. For 
example, imagine a contract that operates as a crosschain bridge. It could have a role 
called **PAUSER**. This role could be required to call a function that enables 
pausing of the contract. Any transaction submitted by an account that did not 
have the **PAUSER** role would be reverted.

Simplistic contracts might have a single role, **OWNER**, that can only be assigned
to one account. For these contracts, the **owner** account is the only account 
that can submit transactions that call configuration functions without reverting.

The greater degree of flexibility afforded by Role Based Access Control compared 
to simplistic **OWNER** style access control has security implications. For example, 
a contract might be able to mint new tokens, and thus have a **MINTER** role to control
this action. Minting new tokens could change the tokenomics of the contract, and hence 
must only be executed if there is agreement between administrators. Access to this 
configuration action might be limited to a multi-signature wallet account. The same 
contract might have a **PAUSER** role that can be used to stop data processing within 
the contract. The action to pause the contract needs to occur as quickly as possible,
to halt an in-progress attack. However, access to the role needs to be limited to trusted
accounts, to prevent attackers causing a Denial of Service attack on the contract, by
continually pausing the contract. Using a multi-signature wallet to control this action
is not ideal, as multiple parties would need to work together to pause the contract, thus 
allowing attacks to continue longer than they otherwise would. In this situation, 
multiple trusted accounts could be granted **PAUSER** role. Any one of the accounts 
could then pause the contract.

For a small project, when a contract is deployed, it might be tempting to use 
simplistic **OWNER** style access control. 
However, it is better to deploy a contract configured for fine grain
Role Based Access Control, where all roles are initially assigned to the one account.
In this way, as the project using the contract matures, new accounts can be granted
roles and the original account's access can be revoked.
It should be noted that the benefits of RBAC are only realised once 
access for different roles is allocated to additional accounts. 

For Ethereum based projects, the OpenZeppelin project has an example
contract [AccessControl.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol)
that can be used to implement Role Based Access Control. Using this template,
checking an address has been granted a role becomes as simple as calling 
the function **hasRole**.
The code below shows how this would work in practice.

```solidity
contract Example is Pausable, AccessControl {
    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
    }

    function pause() external {
        require(hasRole(PAUSER_ROLE, msg.sender), "Must have PAUSER role");
        _pause();
    }
}
```