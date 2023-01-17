### Testing

Code that is not tested is far more likely to contain bugs than code that has been tested. Comprehensive tests allow new features to be added without fear of breaking existing functionality. Hence, the more comprehensive the testing of the project, the less risky the project is. 

Testing falls into several categories:

* Unit Testing: Checks the operation of a single component, module, class, or contract in isolation. Because of the low level nature of this testing, it should be possible to check all error conditions. [Mocking](https://en.wikipedia.org/wiki/Mock_object) can be used to simulate the behavior of real components that are relied upon by the component to be tested.
* Integration Testing: Checks the operation of multiple components together. 
* System Testing: Checks the operation of the entire product. This testing could check the system with no data, simulating a new install, with prefilled data simulating multiple years of operation, or could use real world data. A type of System Testing is Upgrade Testing. This type of testing checks that existing version(s) of the system can be upgraded to the new version of the system. System testing is also known as Regression Testing or End to End Testing. 
* Performance Testing: Measures the latency, speed of operation, gas usage, transactions per second, or some other metric. These tests can be used to check that the performance of a system has not degraded from one software release to the next. Performance testing can be done at the unit, integration or system level. 
* Acceptance Testing: Checks that the software can be deployed and that the deployed software operates as expected.
* Interoperability Testing: Checks that two software products can communicate based on a standard.

Testing can be automated or manual. Automated tests allows software to be tested using scripts. [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration) is a form of automated testing that runs a test script when code is committed to a source code repository. Manual testing requires people to perform a sequence of tests. As manual testing is labor intensive, there is the risk that it is performed for some software releases and not other software releases. As such, it is preferable to only rely on manual testing to do some Acceptance Testing, and not to rely on it to perform other forms of testing, for instance System Testing. 

Tests can be [happy path](https://en.wikipedia.org/wiki/Happy_path) tests that only check the operation of the software in ideal conditions. [Unhappy path](https://en.wikipedia.org/wiki/Happy_path) tests check what occurs when an error condition arises. Tests should check both happy and unhappy paths. 

[Code Coverage](https://en.wikipedia.org/wiki/Code_coverage) describes what percentage of the code is tested, based on the lines of code. It provides a rough metric of how well code has been tested. It can be used to determine whether, when new code is added, more or less code overall is being tested. 


**Considerations**

*Unit Testing*

* Mocking can lead to [brittle](https://softwareengineering.stackexchange.com/questions/356236/definition-of-brittle-unit-tests) tests. That is, if complex behavior is simulated in some mocked code, then the mocking code will need to be modified when the component it is mocking changes. An additional problem is that the component being mocked might change, but developers fail to update the mock of the component. In this case, the unit test passes, despite the fact that the component being tested would fail at integration and system testing. 

*Code Coverage*

* Code coverage should be higher for complex pieces of code. 
