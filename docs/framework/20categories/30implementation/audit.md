### Code Auditing

Code audits are necessary to ensure that a protocol's code performs as per its intended logic. Code that has not been audited is far more likely to contain bugs than code that has. Any protocol that does not have code audits should be trusted less by users and developers. However, code audits should not be viewed as a comprehensive security solution. For example, protocols sometimes conduct audits on specific parts of their architecture or deploy unaudited code for changes/new features, which can be a potential source of risk outside of the initial audit.

*Considerations:*

* Has the code been audited? How many audits have been completed? Were these audits conducted by different organizations?

    Several audits, ideally by different organizations, are more likely to uncover more potential vulnerabilities.

 * When was the most recent audit? Has the protocol been upgraded since the last audit? How often is the protocol's code audited? 

    Ensuring audits are up-to-date with code changes and are conducted frequently offers more assurance about their validity.

 * What was the scope of the audit? Does it cover all of the key on-chain components?

    Wide audit scope offers assurances around more parts of the protocol. At a minimum, however, audits should cover all core on-chain contracts. 

 * Is the deployed version of the protocol's code audited?

 * What were the findings of the audit? Were there critical findings that were left unaddressed? What are the scenarios in which these could be exploited?

    Sometimes findings are "acknowledged" by team members but not addressed either because the attack scenarios are mitigated by other means, are considered difficult to pull off, or the requested changes are difficult to make. Understanding these findings enables a better assessment of the potential implementation risks.

* What are the audit firm's track record and reputation?
 
    Not all audit firms are created equal. The level of confidence around the audit might need to be weighted by their track record, reputation, or other measures of the caliber of the team.

* Have changes made in response to audit findings been audited? If not, how significant are these changes?

    The critical bug that led to the [Nomad hack in August 2022](https://medium.com/nomad-xyz-blog/nomad-bridge-hack-root-cause-analysis-875ad2e5aacd) was introduced during a response to the auditor's findings. While Nomad's team was under the impression that the post-remediation code changes were re-audited by the auditor, it was, in fact, not the case. The auditor's report only certified the state of the codebase prior to the changes. 

While code audits are vital to ensure the robustness of a protocol, they do not guarantee security. In the past, protocols have been compromised despite completing several audits. Thus, audits should only be one of the risk management strategies used by protocols, but not their entire security stack against hacks.
