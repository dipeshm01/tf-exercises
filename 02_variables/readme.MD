## Different ways of setting variables

*Higher the precedence, more is the chance that the variable will take effect*

- By using command-line-flags **Precedence: 1**

  > terraform apply -var "prefix=Manier" --auto-approve

- By using \*.auto.tfvars **Precendence: 2**

  ```
  separator="+"
  ```

- By using terraform.tfvars **Precedence: 3**
  ```
  separator="-"
  filename="majumdar.txt"
  content="i m the absolute best"
  ```
- By setting Env variables **least, in order of precedence**

  > export TF_VAR_content="i m the very best"

- By user-prompt. When you dont mention any value in variables.tf. Example -
  ```
  variable "prefix" {
  }
  ```
