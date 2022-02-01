#!/usr/bin/env sh

set -e

# Install eksctl

echo "Downloading aws sam CLI..."
sudo apt install unzip
aws_sam_version="1.37.0"

curl -LO "https://github.com/aws/aws-sam-cli/releases/download/v${aws_sam_version}/aws-sam-cli-linux-x86_64.zip"
echo "Waiting for Installing ..."
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
rm -rf aws-sam-cli-linux-x86_64.zip
sudo ./sam-installation/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-sam-cli --update
rm -rf sam-installation
echo "AWS_SAM__CLI_VERSION=$(sam --version)"