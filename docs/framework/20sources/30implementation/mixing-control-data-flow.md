### Mixing of Control and Data Plane

The terms *Control Plane* and *Data Plane* come from networking [[1](https://en.wikipedia.org/wiki/Control_plane)]. In the
context of networking, the Control Plane configures the network topology 
and routing tables, and the Data Plane is the information that is 
communicated across the network. In the context of computing, the 
Control Plane is the configuration of the system, and the Data Plane
is the data processing. 

Functions in smart contracts can be ones that control the configuration 
of the contract. These can be thought of as Control Plane functions. 
For example, a function to pause the contract is a Control Plane function. 
Data Plane functions are functions that process data. For example, a 
function to mint some tokens is a Data Plane function.

Poor project design can result in smart contract functions that contain 
both Control Plane and Data Plane logic. Mixing these two planes in the 
one function dramatically increases the risk of the project. An attacker 
may be able to compromise the Data Plane part of a mixed processing function, 
and then use that to change the configuration of the project, accessing the 
Control Plane part of the mixed function. This can lead to the attacker 
having the ability to control aspects of the project such as minting tokens.

***
#### Example
As example of this type of issue being exploited is the 
[August 2021 PolyNetwork issue](https://rekt.news/polynetwork-rekt/). The 
PolyNetwork code was written such that its **EthCrossChainManager** contract
was the owner of the **EthCrossChainData** contract. The **EthCrossChainData** 
contract held important information including the public keys used to verify
crosschain requests. Doing this allows for function calls for **EthCrossChainData**
to go via the **EthCrossChainManager** contract. Access from the **EthCrossChainManager** contract
to the **EthCrossChainData** contract could be deemed part of the Control Plane. 
The **EthCrossChainManager** contract also had a function 
**verifyHeaderAndExecuteTx** that was used to process  Data Plane requests. 
The attacker was able to create a carefully constructed call to
**verifyHeaderAndExecuteTx** that allowed the Data Plane request to modify
data in the **EthCrossChainData**, that ultimately led to the attacker being 
able to steal funds. 

The PolyNetwork code would not have been vulnerable to this type 
of attack if there had been a clear separation of Control Plane and Data 
Plane. For example, rather than doing updates to the **EthCrossChainData** 
contract via the **EthCrossChainManager** contract, updates could have been 
only allowed from an Externally Owned Account (EOA) or a MultiSig Wallet
account.
