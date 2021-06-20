```
Plan: 1 to add, 0 to change, 1 to destroy.
random_pet.pqr: Destroying... [id=Mr. camel]
random_pet.pqr: Destruction complete after 0s
random_pet.pqr: Creating...
random_pet.pqr: Creation complete after 0s [id=Mr.mantis]
```
Need to catch that id above and use it in file name... 
so following variable can be used:
${random_pet.pqr.id}
This variable has been used in the main.tf file. Note this variable, if used in variables.tf doesn't work. (reason unknown)