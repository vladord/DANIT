#!/bin/bash
#./terraform-init.sh dev plan

ENVIRONMENT=$1
ACTION=$2
ARN=$(aws sts get-caller-identity --query Arn --output text)
USER_NAME=${ARN##*/}

terraform init -reconfigure \
    -backend-config="bucket=terraform-state-danit-devops-ord" \
    -backend-config="key=${USER_NAME}/$ENVIRONMENT/terraform.tfstate" \
    -backend-config="region=eu-central-1"
terraform workspace new $ENVIRONMENT || true
terraform workspace select $ENVIRONMENT
terraform ${ACTION} -var-file "./environments/${ENVIRONMENT}-variables.tfvars" #-auto-approve 
