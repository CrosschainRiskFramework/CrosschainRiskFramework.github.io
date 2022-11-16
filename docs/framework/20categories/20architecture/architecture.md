## Protocol Architecture Risk
Risks that stem from the security assumptions, trade-offs, and limitations of the design of a protocol are collectively referred to as _Protocol Architecture Risks_. To methodically analyze such risks, we first introduce a framework for organizing cross-chain protocols into layers of abstraction based on scope and functionality. Each layer depends on layers below it for functionality and security. Hence, the architectural risks at each layer subsume those below it. The framework was adapted from [work introduced by L2Beat and Socket](https://gov.l2beat.com/t/l2bridge-risk-framework/31) and is illustrated in the diagram below.

<figure markdown>
  ![Layers of cross-chain communication protocols](protocolstack.png){width=700}
  <figcaption>Layers of cross-chain communication</figcaption>
</figure>


{% include-markdown "messaging.md" %}
{% include-markdown "coordination.md" %}
{% include-markdown "token-bridges.md" %}
{% include-markdown "liquidity-networks.md" %}
{% include-markdown "bridge-aggregation-protocols.md" %}
