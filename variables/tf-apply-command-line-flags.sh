#!/bin/bash
set -x
terraform apply -var "prefix=Manier" -var "content=I m a rock star" --auto-approve
source set-env-variables.sh
set +x
