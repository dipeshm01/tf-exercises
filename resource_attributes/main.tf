resource "local_file" "xyz" {
  filename = var.filename
  content  = "i m the best. ${random_pet.pqr.id} is second best"
}

resource "random_pet" "pqr" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
