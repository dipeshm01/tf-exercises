When you do a `terraform apply` output variables are printed as shown below:

```
Changes to Outputs:
  + which-petname = (known after apply)
random_pet.pqr: Destroying... [id=Mr. camel]
random_pet.pqr: Destruction complete after 0s
random_pet.pqr: Creating...
random_pet.pqr: Creation complete after 0s [id=Mrs. airedale]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

which-petname = "Mrs. airedale"
```
