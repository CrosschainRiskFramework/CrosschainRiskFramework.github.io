### Protocol Design
Distributed systems protocol design is an extremely complex topic. This sub-section describes some important considerations.

**Replay Prevention**: Replay attacks are when an attacker copies a valid message and resubmits it to a part of the system. Protocols need to be designed to reject messages that have already been processed. 

**Message Timeout**: Blockchain systems fail transactions unexpectedly. For instance due to insuffient gas, incorrect transaction nonce, or a revert in some contract code. An attacker may then copy the failed transaction, and if the function they are submitting it to has not authentication, resubmit the transaction any time in the future. Having a timeout in a message means that old failed messages can not be submitted at some point in the future.

**In-order Execution**: Some protocols require messages to be processed in the order that they were generated. If this is the case then it is essential that processing code enforces this in-order execution.


