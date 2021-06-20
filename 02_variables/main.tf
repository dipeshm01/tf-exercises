resource "local_file" "xyz" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "pqr" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
