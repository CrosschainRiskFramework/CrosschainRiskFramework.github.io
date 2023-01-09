### Verified Code on Block Explorer

Source code verification for all deployed smart contracts is critical for user safety. It ensures that the source code of a protocol’s smart contract is the same as the one executed at the contract address. Moreover, it allows users interacting with a protocol’s smart contract to read and audit it. This enables them to determine what code has been deployed and what types of risks the user is taking by interacting with the protocol. As a result, if a protocol’s code isn’t verified, it is considered less transparent and should be trusted less by users and developers. 

All deployed contracts should have [source code uploaded and verified on Etherscan](https://docs.etherscan.io/tutorials/verifying-contracts-programmatically), or other block explorers specific to the chain if the contracts are deployed on an EVM-compatible chain. For instance, code for smart contracts on Polygon can be verified on [Polygonscan](https://mumbai.polygonscan.com/verifyContract), and those on Arbitrum can be verified on [Arbiscan](https://arbiscan.io/verifyContract). 

The process of verifying source code on a block explorer like Etherscan typically includes the following steps:
1. Enter the contract address that needs to be verified.  
2. Input the compilation settings (like compiler type and version, the open-source license) to a compiler. 
3. Provide the source code that makes up the smart contract.
4. The verification tool compares the deployed bytecode with the recompiled bytecode. If the codes match, the contract is deemed verified.
5. Once verified, the smart contract is marked “verified” and is curated under the “Verified Contracts'' in the “Blockchain” tab. 

Additionally, one should verify that the security parameters that govern the logic of smart contracts are initialized as expected. Any discrepancies at the initialization of a smart contract could be a risk vector. For instance, in the [case of Celo’s Optics bridge](https://forum.celo.org/t/optics-recovery-mode/2452), the recovery mode timelock was initialized at only 1 second instead of the expected 1 day, leaving users’ funds at risk.

*Considerations:*

* What tool has been used to verify the source code?




Source code can be verified by different tools such as Etherscan, Sourcify, Tenderly, etc., but not all tools are created equal. The level of confidence around the source code verification must be assessed based on the tool used. For instance, for contracts deployed on Ethereum, [Etherscan’s verify contract code tool](https://etherscan.io/verifyContract) is considered a trustworthy tool.

* Are all smart contracts of the application verified?




It’s critical for the source code of all key smart contracts of a protocol to be verified. It’s possible for protocols to verify only certain smart contracts while hiding malicious code to give a false perception of its smart contracts being verified.

* Could the protocol be less transparent about their source code on purpose? 




The rule should always be to trust, but verify. If the source code isn’t verified, a protocol can be a potential [rug](https://academy.binance.com/en/glossary/rug-pull), hiding the real intention of their smart contract. Or, the protocol could be following the practice of ‘security through obscurity', keeping the code unverified and thus private to prevent people from learning about how a specific feature works and potentially misusing it.

For non-EVM compatible chains, the practice of source-code verification through block explorers is not a standard and is typically not supported. However, there often exist other tools or processes that are considered a standard for source code verification for specific programming languages used by different non-EVM chains. For instance, [Move Prover (MVP)](https://arxiv.org/abs/2110.08362) is used to verify smart contracts written in the Move programming language for chains like Aptos and Sui. Thus, entities building applications on these need to find different ways to ensure the trustworthiness of their deployed smart contracts.
