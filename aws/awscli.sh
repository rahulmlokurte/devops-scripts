#!/usr/bin/env Bash

set -e

# Install eksctl

echo "Downloading aws CLI..."
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
echo "Waiting for Installing ..."
unzip -qq awscliv2.zip
rm -rf awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
rm -rf aws
echo "AWSCLI_VERSION=$(aws --version)"