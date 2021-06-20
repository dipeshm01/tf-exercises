resource "local_file" "xyz" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "pqr" {
  prefix    = "Mrs."
  separator = " "
  length    = "1"
}

output "which-petname" {
  value = "${random_pet.pqr.id}"
  description = "Record pet id generated by random pet resource"
}