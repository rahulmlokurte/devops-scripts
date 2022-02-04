[![terraform-install](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/terraform-install.yml/badge.svg?branch=master)](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/terraform-install.yml)
[![kubernetes-install](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/kubernetes-install.yaml/badge.svg?branch=master)](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/kubernetes-install.yaml)
[![aws-install](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/aws-install.yml/badge.svg)](https://github.com/rahulmlokurte/devops-scripts/actions/workflows/aws-install.yml)

# Local-Software-Install-Scripts

This repository contains a collection of scripts that I use to automate my devops work. It contains scripts
to install kubernetes, terraform and few other tools.

## Supported Tools

Below are the currently supported tools:

- [terraform](./terraform)
    - [terraform cli](./terraform/terraform-install.sh)
    - [tflint](./terraform/tflint.sh)
- [aws](./aws)
    - [aws cli](./aws/awscli.sh)   
    - [aws SAM cli](./aws/aws-sam-cli.sh)
- [kubernetes](./kubernetes)
    - [kubectl](./kubernetes/kubectl.sh)
    - [eksctl](./kubernetes/eksctl.sh)
    - [helm](./kubernetes/helm.sh)

## Prerequisites

- wsl for Widows
- Ubuntu 20.04

## How to use this repository

- Clone the repository [devops-scripts](https://github.com/rahulmlokurte/devops-scripts)
- Run the scripts by going to particular directory (for example aws)
- Run the scripts by running the script present in the folder (for example awscli.sh)
- It will install the required tools (for example awscli)

## Authors

This repository is managed by [Rahul Lokurte](https://github.com/rahulmlokurte)

## License

MIT licensed. See [LICENSE](LICENSE) for full details.
