#!/bin/bash
set -x
terraform apply -var "prefix=Manier" --auto-approve
source set-env-variables.sh
set +x
