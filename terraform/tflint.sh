#!/usr/bin/env sh

set -e

# Install Tflint

echo "Downloading Tflint..."
sudo apt install unzip
tflint_version="0.34.1"
curl --fail --silent -L -o /tmp/tflint.zip "https://github.com/terraform-linters/tflint/releases/download/v${tflint_version}/tflint_linux_amd64.zip"
unzip -u /tmp/tflint.zip -d /tmp/tflint && rm -rf /tmp/tflint.zip
sudo install -D /tmp/tflint/* -t /usr/local/bin
rm -rf /tmp/tflint
echo "TFLINT_VERSION=$(tflint --version)"