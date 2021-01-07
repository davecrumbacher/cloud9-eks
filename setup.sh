#!/bin/sh

# Before running this script, do steps 1 and 2.
#
# 1. Change Cloud9 EC2 Instance Profile to TeamRoleInstanceProfile
# 2. Disable temporary credentials in Cloud9 settings

# 3. Install tools
sudo yum -y install jq gettext bash-completion moreutils

# 4. Install kubectl
sudo curl --silent --location -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/amd64/kubectl && sudo chmod +x /usr/local/bin/kubectl

# 5. Install eksctl
sudo curl --silent --location https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz | tar xz -C /tmp && sudo mv /tmp/eksctl /usr/local/bin

# 6. Configure kubectl
aws eks update-kubeconfig --name my-eks-cluster --region us-east-2

# 7. Confirm worker nodes are ready
kubectl get nodes
