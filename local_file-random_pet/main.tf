resource "local_file" "xyz" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "pqr" {
  prefix    = "Mr."
  separator = " "
  length    = "1"
}
