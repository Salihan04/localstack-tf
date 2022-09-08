#! /bin/sh

find_cxinfra_dir(){
  result=$(git rev-parse --show-toplevel |  tr -d '\n')

  echo "$result"
}

prechecks(){
  curr=$(pwd)
  dir=$(find_cxinfra_dir)

  if [ "$ENABLE_PRECHECKS" = true ]; then
    cd "$dir" || cd .

    printf "\033[34mRunning terragrunt hclfmt...\033[0m\n"
    if [ "$RUN_IN_CI" = true ]; then
      terragrunt hclfmt -recursive --terragrunt-check
      if [ $? -eq 1 ]; then
        exit 1
      fi
    else
      terragrunt hclfmt -recursive
    fi

    printf "\033[34mRunning terraform fmt...\033[0m\n"
    if [ "$RUN_IN_CI" = true ]; then
      terraform fmt -recursive -check
      if [ $? -eq 0 ]; then
        exit 1
      fi
    else
      terraform fmt -recursive
    fi

    printf "\033[34mRunning tflint...\033[0m\n"
    tflint -f junit . || exit 1

    printf "\033[34mRunning terraform validate...\033[0m\n"
    terraform validate || exit 1

    printf "\033[34mRunning terragrunt validate-inputs...\033[0m\n"
    cd "$curr" || cd .
    terragrunt validate-inputs --terragrunt-strict-validate || exit 1
    cd "$dir" || cd .

    printf "\033[34mRunning tfsec...\033[0m\n"
    tfsec . || exit 1
  fi
}

prechecks
