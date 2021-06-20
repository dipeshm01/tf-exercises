resource "local_file" "xyz" {
  filename = var.filename
  content  = var.content
  depends_on = [
    random_pet.pqr
  ]
}

resource "random_pet" "pqr" {
  prefix    = "Mrs."
  separator = " "
  length    = "1"
}
