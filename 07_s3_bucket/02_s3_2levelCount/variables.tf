variable "bucket-names" {
  type = list(string)
  default = ["k3pgnq0f4-1","k3pgnq0f4-2","k3pgnq0f4-3"]
}

variable "environment" {
  type = list(string)
  default = [ "dev","acc","prod" ]
}
