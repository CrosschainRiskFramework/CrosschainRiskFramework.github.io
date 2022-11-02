# Introduction

Risk is the measure of the extent to which an entity is threatened by potential circumstances or events, and is typically a function of (i) the adverse impacts that would arise if the circumstance or event occurs, and (ii) the likelihood of occurrence.  [NIST - National Institute of Standards and Technology]

This document provides a high-level systematic overview of the security risks in cross-chain protocols by identifying, classifying, and analyzing the elements of risk inherent in the design, implementation and operation of such infrastructure. In addition, it profers a set of risk-controls and best practices to mitigate the likelihood and magnitude of various risks. While this document offers a general toolkit for reasoning about cross-chain protocols, it does not directly analyse individual protocols.

## Crosschain Communication Protocols

**Working definition**: ...

**Modalities of Cross-chain Communication**: ...

- Asset Exchange

- Asset Transfer

- General Purpose Communication:

## Security Challenges
At its essence, cross-chain communications create dependency relationships between two or more networks. Such dependency relationships typically involve state change in one network driving state change in another. These relationships can be _unidirectional_ or _bidirectional_, _transient_ or _persistent_.  The goal of cross-chain protocols is to enable and guarantee the integrity of these dependencies. To this end, given two networks, a source network and a destination network, where the state in the destination network is dependent on the state in the source network, cross-chain protocols must satisfy the following core properties:

1. only states that are valid in the canonical ledger of the source network are communicated to the destination

1. all relevant state transitions in the source network are relayed to the destination network in a timely manner

1. any invariants that emerge from the cross-chain interactions are always preserved e.g. total supply of wrapped asset in the destination matches supply of underlying native asset in the source.


TBA
- _note about the size scale and magnitude of hacks_
- _challenges in systematically reasoning about the Security and risk in this space_

## Purpose and Scope of this Framework
