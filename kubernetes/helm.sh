#!/usr/bin/env sh

set -e

# Install eksctl

echo "Downloading Helm..."
helm_version="3.8.0"
curl -LO https://get.helm.sh/helm-v${helm_version}-linux-amd64.tar.gz
tar -zxvf helm-v${helm_version}-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64 && rm -f helm-v${helm_version}-linux-amd64.tar.gz
echo "HELM_VERSION=$(helm version)"

