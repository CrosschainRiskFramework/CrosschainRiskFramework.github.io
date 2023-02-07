## Risk Scoring Overview
The overall risk score is calculated as the product of the risk scores of each of the categories:

```
Overall Risk Score = 100,000 - (Network Consensus Risk x Architectural Risk x Implementation Risk x Operational Risk)
```

Network Consensus Risk, Implementation Risk, and Operational Risk each score in the range 0 to 10. Architectural Risk scores between 0 and 100. As such, the Overall Risk Score will be between 0 and 100,000, where 0 is a perfect score. That is, a low risk project will have a low risk score.

