#!/bin/bash

echo "Destroy configuration..."
terraform -chdir=terraform destroy -auto-approve
terraform -chdir=backend destroy -auto-approve