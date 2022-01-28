#!/usr/bin/env Bash

set -e

# Install eksctl

echo "Downloading eksctl..."
eksctl_version="0.80.0"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v${eksctl_version}/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mkdir -p ~/.local/bin/eksctl
mv /tmp/eksctl ~/.local/bin/eksctl
export PATH="$HOME/.local/bin/eksctl:$PATH"
eksctl version