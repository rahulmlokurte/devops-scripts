#!/usr/bin/env sh

set -e

# Install Kubectl
kubectl_version="1.23.3"
echo "Downloading kubectl..."
curl -LO https://dl.k8s.io/release/v${kubectl_version}/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "KUBECTL_VERSION=$(kubectl version --client)"