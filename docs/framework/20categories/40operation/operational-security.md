### Operational Security

[Operational Security](https://www.fortinet.com/resources/cyberglossary/operational-security) (also known as OPSEC) is a process used to protect sensitive information. The idea is to determine how to protect sensitive information by viewing operations from the perspective of an attacker. The processes originated during the [Vietnam War](https://en.wikipedia.org/wiki/Operations_security#History). The following sections discuss the five steps of the Operational Security process.

#### Identification of Sensitive Information
The first step of Operational Security is identifying what information needs to be protected, and the relative sensitivity level of each type of information. In the context of a crosschain protocol, sensitive information will to include:

* Private Keys used to sign blockchain transactions.
* Private Keys used to attest to the validity of information in the crosschain protocol.
* Private Keys used as part of blockchain consensus protocols.
* Private Keys associated with a [Transport Layer Security (TLS) web server certificate](https://aws.amazon.com/what-is/ssl-certificate/). 
* Private Keys used with key agreement and asymmetric encryption protocols. 
* Private Keys used with [PGP](https://en.wikipedia.org/wiki/Pretty_Good_Privacy) and other signed and encrypted email.
* Passwords.
* Information about and code fixes for security vulnerabilities that have not yet been deployed into production.

Sensitive information could also include:

* The organization's [Org Chart](https://en.wikipedia.org/wiki/Organizational_chart). This allows attackers to identify specific individuals to target with [Spear Phishing](https://www.trendmicro.com/vinfo/us/security/definition/spear-phishing) attacks. Note that social media platforms such as [LinkedIn](https://www.linkedin.com/) are used by attackers to determine organizations' org charts.
* Identities of validators or other entities that help operate the crosschain protocol. Attackers could target entities involved in the protocol with Spear Phishing attacks.
* Internal organizational procedures. Sensitive procedures include obvious ones such as vulnerability response procedures and what security software is installed on company computers, but also includes whether employees use company issued computers or use their own computer (that is [Bring Your Own Device](https://en.wikipedia.org/wiki/Bring_your_own_device)), software development practices, and HR policies.
* Architecture and design information. Most crosschain protocols publish their system architecture and design information; hoping that this will provide users of their protocol greater assurance of the trustworthiness of the protocol. However, publishing design information makes it easier for attackers to identify potential weak points in the system.
* Source code. Most crosschain protocol code is open source. This allows everyone to review the code, thus helping to provide users with assurance that the code has been written with security in mind. However, attackers are also able to view the code, and may be able to identify vulnerabilities in the code.  
* Known issues with source code. As most crosschain protocol code is open source, it is common for reported issues to be also publicly available. Sometimes the reported issues, though appearing to be innocuous, may highlight security issues.
* Server log file information. This information is likely to indicate the usage of the protocol, which may be commercially sensitive. It may also provide insights into unexpected behavior within the protocol. Attackers may use this unexpected behavior to mount attacks.


#### Analysis of Threats

The second step of Operational Security is identifying possible actors for each of the categories of sensitive information and analyzing their capabilities. For crosschain protocols threats are likely to come from several groups:

* Attackers aiming to steal funds from the crosschain protocol. These attackers can range in sophistication from people new to blockchain to state sponsored hackers such as North Korea's [Lazarus Group](https://en.wikipedia.org/wiki/Lazarus_Group).
* Attackers or competitors aiming to discredit or reduce trust in the crosschain protocol.
* [General Front Running Bots](https://www.youtube.com/watch?v=Jiis5Kr_QU0) viewing transactions in the transaction pool and submitting similar transactions ahead of the original transactions. These bots could see an attack in progress and would then attempt to execute the attack repeatedly automatically. 
* [White Hat Hacker](https://en.wikipedia.org/wiki/White_hat_(computer_security)) hoping to earn a bug bounty for identifying an issue.
* University researchers aiming to identify vulnerabilities in protocols. If they can claim credit for finding the vulnerability, then they will be able to write an academic paper about the issue, and gain academic recognition. This is particularly important for [Doctoral Candidates](https://en.wikipedia.org/wiki/Doctor_of_Philosophy) who need to contribute some original research to complete their doctorate.
* Disgruntled employees and other [insiders](https://www.cisa.gov/defining-insider-threats) acting maliciously.


#### Analysis of Weaknesses 
Given the information being protected, and the possible threat actors, assess the current safeguards that are in place. From there, and determine what weaknesses exist.


#### Assessment of Risk
The next step is to rank each of the weaknesses to determine the likelihood of the attack happening and the likely impact of the attack. The likely impact will include the immediate financial loss, reputational damage, and the time to address the attack. The more likely an attack and the higher the likely loss, the higher the priority should be to mitigate the weakness.


#### Application of Countermeasures 
The final step of Operational Security is to mitigate risks. The range of possible countermeasures is vast and beyond the scope of this document. However, two important mitigations are [Responsible Disclosure](https://en.wikipedia.org/wiki/Coordinated_vulnerability_disclosure) and [Bug Bounty Programs](https://en.wikipedia.org/wiki/Bug_bounty_program). White Hackers will have a means of being compensated for finding issues with a Bug Bounty Program. University researchers will have a means of reporting their findings and be sure to be able to claim recognition with a Responsible Disclosure process. Not having these programs in place may lead White Hat Hackers to attack the system and return some percentage of their attack earnings, while retaining the rest as a *Bug Bounty*, and may lead university researchers to publish their results prior to contacting the crosschain project. 







