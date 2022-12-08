### Ability to Pause Project
This section described the implementation risks associated with being able to pause a project. 
Operational risks related to pausing are covered in the [Ability to Pause Operational Risk section](../40operation/ability-pause.md).

All Data Plane functions should be *pausable*. For example, a bridge contract could 
have a function that could transfer coins based on actions on another blockchain. 
The ability to *pause* a function in a 
project allows administrators to stop functions from successfully 
executing. If there is a vulnerability that is being actively 
exploited in a project, having the ability to pause a function 
could stop the exploitation of the project midway through the 
attack.

For Ethereum based projects, the OpenZeppelin project has an example 
 contract [Pausable.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/security/Pausable.sol)
that can be used to implement pausing. Using this template, 
pausing a function becomes as simple as adding a modifier `whenNotPaused`. 
The code below shows how this would work in practice.

```solidity
contract Example is Pausable {
    function pause() external onlyOwner {
        _pause();
    }
    function transfer(
        address _sender,
        address _tokenContract,
        address _recipient,
        uint256 _amount
    ) external whenNotPaused {
        // Only executed when not paused
```

When analyzing whether a project can be paused, it is important
to check whether all data processing functions can be paused, or
just some parts of the project. 


***
#### Example
For example, in [August 2022 the Nomad Bridge](https://medium.com/nomad-xyz-blog/nomad-bridge-hack-root-cause-analysis-875ad2e5aacd) had an issue
(see [Rekt](https://rekt.news/nomad-rekt/) for an analysis of the issue from 
people outside the team).
An attacker was able to determine a methodology for stealing funds using the `Replica` 
contract's `process()` function. Depite most of the Data Plane processing functions 
in the project being pausable, the `process()` function was not. This meant that the 
attack was able to proceed without the administrators of the project being able to stop it. 



