### Decentralization of Operations

[Third-party Attestation Protocols](../20architecture/messaging.md/#third-party-attestation-protocols) rely on sets of independent parties. For example, in a [Proof of Authority](../20architecture/messaging.md/#proof-of-authority) protocol messages are deemed valid if at least ```M``` of ```N``` parties sign messages. When external parties attempt to audit the security of the protocol deployment, they will reason about the security of the protocol based on the values of ```M``` and ```N```. They will expect that at least ```M``` parties would need to be compromised, or choose to maliciously sign a value, for a malicious message to be trusted. If one party controls multiple signers, then the true security of the system is different to what it first appears. For example, if one party controls ```M - 1``` signers, then an attacker would only need to compromise that party, and one of the other independent parties. 

Considerations for the degree of independence of signers:

* Does one party control multiple private keys?
* Are some of the parties part of the same company or group of companies?
* Are some parties reliant on other parties monetarily? That is, does one party provide grants to other parties?
* Are the signers located in different countries? That is, could a government exert influence on the signers?
