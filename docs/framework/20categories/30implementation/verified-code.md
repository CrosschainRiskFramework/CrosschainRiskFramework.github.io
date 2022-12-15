### Verified Code on Block Explorer

Source code verification for all deployed smart contracts is critical for user safety. It acts as an assurance of correctness of a smart contract by ensuring that a protocol’s submitted source code is the same as the one executed at the contract address. Moreover, it allows users interacting with a protocol’s smart contract to read and audit it. This enables them to determine what code has been deployed and what types of risks the user is taking by interacting with the protocol. As a result, if a protocol’s code isn’t verified, it is considered less transparent and should be trusted less by users and developers. 

*Considerations:*
* What tool has been used to verify the source code?

Source code can be verified by different tools such as Etherscan, Sourcify, Tenderly, etc., but not all tools are created equal. The level of confidence around the source code verification must be assessed based on the tool used. For instance, for contracts deployed on Ethereum, [Etherscan’s verify contract code tool](https://etherscan.io/verifyContract) is considered a trustworthy tool.
* Which module of the source code is verified? Does it cover all the key on-chain components?

It’s critical for the source code of all key smart contracts of a protocol to be verified. It’s possible for protocols to verify only certain smart contracts while hiding malicious code to give a false perception of its smart contracts being verified.
* Could the protocol be less transparent about their source code on purpose? 

The rule should always be to trust, but verify. If the source code isn’t verified, a protocol can be a potential rug, hiding the real intention of their smart contract. Or, the protocol could be following the practice of ‘security through obscurity', keeping the code unverified and thus private to prevent people from learning about how a specific feature works and potentially misusing it.

All deployed contracts should have [source code uploaded and verified on Etherscan](https://docs.etherscan.io/tutorials/verifying-contracts-programmatically), or other block explorers specific to the chain if the contracts are deployed on an EVM-compatible chain. For instance, code for smart contracts on Polygon can be [verified on Polygonscan](https://mumbai.polygonscan.com/verifyContract), and those on Arbitrum can be [verified on Arbiscan](https://arbiscan.io/verifyContract). Once verified, smart contracts are marked “verified” and are curated under the “Verified Contracts'' in the “Blockchain” tab.

Note: such standards don’t necessarily apply to non-EVM compatible chains.

