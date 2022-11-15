## Protocol Architecture Risk
Risks that stem from the security assumptions, trade-offs, and limitations of the design of a protocol are collectively referred to as _Protocol Architecture Risks_. To methodically analyze such risks, we first introduce a framework for organizing cross-chain protocols into layers of abstraction based on the scope of functionality and concern. Each layer depends on layers below it. Hence, the architectural risks at each layer include those of the layers below it. A typical cross-chain communication use case might rely on a stack of cross-chain communication protocols. The framework was adapted from [work introduced by L2Beat and Socket](https://gov.l2beat.com/t/l2bridge-risk-framework/31) and is illustrated in the diagram below.

![Cross-chain protocol stack (adapted from Socket + L2Beat framework)](protocolstack.png){: style="width:60%"}


{% include-markdown "messaging.md" %}
{% include-markdown "coordination.md" %}
{% include-markdown "token-bridges.md" %}
{% include-markdown "liquidity-networks.md" %}
{% include-markdown "bridge-aggregation-protocols.md" %}
