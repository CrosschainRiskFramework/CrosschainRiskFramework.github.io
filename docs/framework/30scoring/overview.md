## Risk Scoring Overview
The overall risk score is calculated as the maximum of the risk scores of each of the categories:

```
Overall Risk Score = Maximum of (Network Consensus Risk, Architectural Risk, Implementation Risk, and Operational Risk)
```

All of the risk scores range from 0 to 100, where 0 is a perfect score. That is, a low risk project will have a low risk score. The rationale for using the worst risk score (maximum value) across the categories is that a weakness in any part of a crosschain project render the entire project vulnerable to attack.


