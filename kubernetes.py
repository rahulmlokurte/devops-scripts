import subprocess
from pathlib import Path

eksctl = Path('./kubernetes/eksctl.sh')
kubectl = Path('./kubernetes/kubectl.sh')
helm = Path('./kubernetes/helm.sh')
eksctl.chmod(0o755)
kubectl.chmod(0o755)
helm.chmod(0o755)

subprocess.run("cd ./kubernetes && ./eksctl.sh", shell=True)
subprocess.run("cd ./kubernetes && ./kubectl.sh ", shell=True)
subprocess.run("cd ./kubernetes && ./helm.sh ", shell=True)
