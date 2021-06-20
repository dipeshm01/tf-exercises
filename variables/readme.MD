## Different ways of setting variables

- By setting Env variables
  > export TF_VAR_content="i m the very best"
- By using command-line-flags
  > terraform apply -var "prefix=Manier" --auto-approve
- By user-prompt. When you dont mention any value in variables.tf. Example - 
  ```
    variable "prefix" {
    }
  ```
