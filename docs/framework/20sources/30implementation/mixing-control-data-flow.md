### Mixing of Control and Data Flow
Functions in smart contracts can be ones that control the configuration 
of the contract. These are known as “control flow” functions. For example, 
a function to pause the contract is a “control flow” function. “Data flow” 
functions are functions that process data. For example, a function to mint 
some tokens is a “data flow” function.

Poor project design can result in functions that process both control and 
data flows. Mixing these two flows in the one function dramatically 
increases the risk of the project. An attacker may be able to compromise 
the data flow part of a mixed processing function, and then use that to 
change the configuration of the project, accessing the control flow part 
of the mixed function. This can lead to the attacker having the ability 
to control aspects of the project such as minting tokens.

