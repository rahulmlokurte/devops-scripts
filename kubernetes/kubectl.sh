#!/usr/bin/env Bash

set -e

# Install Kubectl
kubectl_version="1.23.3"
echo "Downloading kubectl..."
curl -LO https://dl.k8s.io/release/v${kubectl_version}/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p ~/.local/bin/kubectl
mv ./kubectl ~/.local/bin/kubectl
export PATH="$HOME/.local/bin/kubectl:$PATH"
kubectl version --client