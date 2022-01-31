#!/usr/bin/env sh

DELETE_ALL=${1}

if [ -z "${AWS_ACCESS_KEY_ID}" ] || [ -z "${AWS_SECRET_ACCESS_KEY}" ] || [ -z "${AWS_PROFILE}" ] ; then
  echo "AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_PROFILE must be set"
  exit 1
fi

# put the terraform variable directory in TFVARS_FILE
TFVARS_FILE=""

export  AWS_SDK_LOAD_CONFIG=true

terraform init -input=false
terraform validate
returnCode=$?
if [ $returnCode -ne 0 ]; then
  echo "Terraform validation failed"
  exit $returnCode
fi

if [ -z "${DELETE_ALL}" ]; then
    # shellcheck disable=SC2105
    continue
elif [ "${DELETE_ALL}" = "destroy" ]; then
  terraform output | grep -i S3_bucket
  read -p "Confirm that you have empty the S3 bucket"
  echo "[INFO] destroy all"
  terraform destroy -var-file ${TFVARS_FILE}
  exit 0
else
  echo "[ERROR] Value not recognised"
  echo "[ERROR] ./run_terraform.sh [destroy]"
  exit 1
fi

echo "terraform plan -var-file ${TFVARS_FILE} -out plan.out"
terraform plan -var-file ${TFVARS_FILE} -out plan.out
returnCode=$?
if [ $returnCode != 0 ]; then
    exit $returnCode
fi

read -r "Do you want to apply? Yes/No: " answer

if [ "$answer" = "Yes" ]; then
    terraform apply plan.out
else
  echo "Exiting..."
      exit 0
fi

    

