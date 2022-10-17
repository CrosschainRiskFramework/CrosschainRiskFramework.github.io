### Open Source Code

If the code is stored in a public Github repository, it allows people 
to review the code and the test system. If many people view the code, 
then it is likely that defects in the code will be found. Additionally, 
it allows for the assessment of such things as the number of tests.

Some people argue that a private Github repository is more secure, 
believing that issues can be hidden from attackers. However, 
attackers who are sufficiently motivated often obtain access 
of private repository or to a copy of the code, and are then 
able to exploit any vulnerabilities. Not having the repository 
public then hinders white hat developers from helping, in the 
case of an attack.

When using a public repository, it is important that issues that 
relate to vulnerabilities and code fixes for vulnerabilities are 
not put on the public repository before a release including the 
vulnerability fix has been deployed. Not doing this equates to 
publishing vulnerabilities that can be used to exploit the 
project. The approach that should be taken is to review and 
test the vulnerability fix using the private repo, deploy 
from the private repo, and the push the fix to the public 
repo. 
