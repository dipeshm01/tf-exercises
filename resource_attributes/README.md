Once you do a terraform apply, the output might look something as shown below. However if you want to catch the id as it comes in the output and use it else where... 
```
Plan: 1 to add, 0 to change, 1 to destroy.
random_pet.pqr: Destroying... [id=Mr. camel]
random_pet.pqr: Destruction complete after 0s
random_pet.pqr: Creating...
random_pet.pqr: Creation complete after 0s [id=Mr.mantis]
```
then you can use in this way - 
```
${random_pet.pqr.id}
```
This variable has been used in the main.tf file. 
*Note this variable, if used in variables.tf doesn't work. (reason unknown)*