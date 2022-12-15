### Coordination Protocols

Coordination Protocols allow applications to be spread across blockchains. They allow 
functionality and data on one blockchain to be combined with functionality on another 
blockchain. They allow state to be updated across two or more chains atomically, or
for actions to occur on one chain based on the state of a contract on another chain.

[General Purpose Atomic Crosschain Transaction (GPACT)](https://arxiv.org/abs/2011.12783)
([github](https://github.com/ConsenSys/gpact)) and [Cross Framework](https://datachainlab.github.io/cross-docs/)
are examples of Coordination Protocols. Both are a type of [two-phase commitment protocol](https://en.wikipedia.org/wiki/Two-phase_commit_protocol).
The first phase executes segments of the crosschain execution on various chains, recording a
set of provisional state updates to be applied. The end of this phase is to request that the
crosschain transaction be committed. The second phase performs the update; applying the
provisional state updates. If the second phase did not complete, then it is reapplied as
many times as needed to complete the algorithm. If in the first phase any segment of the
crosschain transaction fails, then the second phase is to discard the provisional updates
on all chains.

The Tree Two Phase Commit protocol is a variant of the two-phase commit protocol
that aims to better utilise underlying communications infrastructure. The participants
in a distributed transaction are invoked in an order defined by a tree structure,
where the root of the tree is the instigator of the transaction and is called the
coordinator. The coordinator is responsible for managing the two phases of the
commitment protocol. This idea of a coordinator managing the protocol is where the 
term _Coordination Protocol_ comes from.

Coordination Protocols sit on top of crosschain messaging protocols. They rely on the
messaging protocols to honestly provide information about events that have occurred on 
remote chains. For example, a segment of a crosschain transaction could execute and 
have provisional updates. The coordination protocol would rely on messaging protocols
to communicate this information to the coordination contract on a remote chain such
that the information can be trusted.

*Considerations:*

* Coordination protocols rely on messaging protocols communicating information from 
  remote chains honestly. 
* The messaging protocol used to prove events occurred on one chain may be different
  from that used to prove events occurred on other chains, despite all of the chains 
  being involved in the same crosschain transaction. Having multiple messaging 
  protocols, one for each chain information will be transferred from, will increase 
  the complexity of the overall crosschain system. 
* The configuration parameters for the messaging protocols will be chain specific. For instance, the 
  finality time for transactions on different chains will depend on the consensus 
  protocol and other security parameters of the chain. Having this chain specific 
  configuration increases the complexity of the overall crosschain system.
* Coordination Protocols require at least two transactions per chain where updates 
  occur, and the chain which acts as the coordination point also has at least two 
  transactions. This is in contrast to simplistic crosschain protocols that don't provide
  atomic updates across chains that require only one transaction per chain. The 
  increased number of transactions means that the latency for applications using 
  these protocols will be higher than for simplistic non-atomic protocols.
* The incentivization at the application level must be designed such that parties
  executing the crosschain transactions for the application are incentivised to 
  unlock all provisional state updates on all chains, irrespective of the outcome
  of the overall crosschain transaction (that is committed or discarded).
* Different coordination protocols provide different features and different security
  guarantees. Understanding the differences is important as the protocols are not
  interchangeable. For example:
     * True atomicity: Some protocols (Cross Framework) do not provide true atomicity. 
    They rely on segments being executed on each chain, and then being reversed if there
    is a failure on any chain. This is in contrast to other protocols (GPACT) that
    provide locking and true atomicity. Not providing true atomicity means that 
    other transactions may interact with the transaction state prior to it being 
    rolled-back.
     * Isolation: Crosschain transactions are executed concurrently with other transactions.
       That is, there could be multiple transactions reading from and writing to the state 
       of the same contract while a crosschain transaction is in progress. This occurs because
       the segments of crosschain transactions are not all executed simultaneously, and are 
       executed as a two phase commitment protocol. Isolation ensures that concurrent 
       execution of transactions leaves the contract state in the same state that would 
       have been obtained if the transactions were executed sequentially. For coordination 
       protocols this comes down to the locking mechanisms provided by the protocol: 
       lock on write, lock on read, or no locking.
     * Function call returning values: Some protocols allow function call return results
    whereas others do not provide this capability. 



