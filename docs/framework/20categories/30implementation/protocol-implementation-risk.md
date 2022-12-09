# Protocol Implementation Risk

Building crosschain protocols involves creating complex on-chain and off-chain components while accounting for the peculiarities and pitfalls of different programming languages, frameworks, virtual machines, runtime environments, and protocols. Inevitably, such complexity increases the likelihood of bugs and vulnerabilities. This type of risk has thus far been the most common cause of bridge hacks witnessed over the last couple of years. 

The lessons, patterns, and practices learned over the years in how to build secure systems and blockchain applications directly apply in the context of crosschain protocols. Exhaustively covering these in this document would be beyond the scope of this document. Instead, this section discusses some of the salient principles and considerations for thinking about crosschain implementation risk. In general, protocol developers should mitigate implementation risk by reducing its likelihood upfront, uncovering extant risk, and having controls to respond to materialized risk. 

- **Reducing risk**
    - *Managing Complexity:* Generally, the higher the complexity of a protocol's design, code, and runtime environments, the higher the implementation risk. Various ways to gauge complexity include: the size and intricacy of codebases (e.g., cyclomatic complexity), the diversity of execution environments, and the number of moving and coordinating pieces. 
    - *Assurances of Correctness:* Ensuring the correctness of the implementation of a protocol against its specification, at different levels of granularity, under a range of inputs and conditions is critical. There are numerous techniques for attaining varying degrees of confidence about the correctness of a protocol, ranging from formal verification to different types of testing. Rigorously employing such techniques reduces implementation risk. 
    - *Principles of Least Privilege:* Ensuring that fine-grained access controls are in-place reduces the impact of compromised entities or credentials.
    - *Principles of Diffuse Privilege:* Ensuring that control of critical operations is decentralized offers checks and balances that mitigate the likelihood and impact of implementation risk.
    - *Nascency Risk:* Cross-chain protocols are built to operate across disparate networks. Some of these ecosystems use tools, frameworks and execution environments that are less mature or well understood. This increases implementation risk.

- **Uncovering extant risk:** Protocols should enable, encourage and incentivize external review and scrutiny of their codebase. This enables vulnerabilities to be surfaced by good-faith actors and reduces the risk of exploits. Some practices that are critical aids to this include up-to-date audits, bug bounties, open-source codebases, and good documentation. 

- **Responding to materialized risk:** Despite best efforts, hacks and exploits are likely to occur. Protocol implementations should include efficient mechanisms for responding to such incidents. Capabilities that enable this include the ability to monitor, detect anomalies, and pause protocols.

The rest of this section will discuss specific practices and considerations that expand on the above framework.

***

{% include-markdown "mixing-control-data-flow.md" %}
***
{% include-markdown "pause.md" %}
***

{% include-markdown "access-control.md" %}
***

{% include-markdown "upgrade.md" %}
***

{% include-markdown "ban-address.md" %}
***

{% include-markdown "known-platform.md" %}
***

{% include-markdown "known-language.md" %}
***

{% include-markdown "open-source.md" %}
***

{% include-markdown "audit.md" %}
***

{% include-markdown "verified-code.md" %}
***

{% include-markdown "testing.md" %}
***

{% include-markdown "formal-verification.md" %}
***

{% include-markdown "documentation.md" %}
***

{% include-markdown "secret-storage.md" %}
***

{% include-markdown "maturity.md" %}



