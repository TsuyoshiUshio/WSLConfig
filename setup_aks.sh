#!/bin/bash

# Install kubectl
# This requires your password.
sudo az aks install-cli

# install jq
sudo apt install jq -y

# fetch all credentials of your k8s clusters
aks_list=$(az aks list)

# Fetch all credentials

for row in $(echo "${aks_list}" | jq -r '.[] | @base64'); do
 _jq() {
    echo ${row} | base64 --decode | jq -r ${1}
 }
 az aks get-credentials -n $(_jq '.name') -g $(_jq '.resourceGroup')
done

# install docker  (Docker CE)

sudo apt-get update

sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common -y 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce -y

sudo apt install zfsutils-linux  cgroup-bin cgroup-lite cgroup-tools cgroupfs-mount libcgroup1 -y
sudo cgroupfs-mount
sudo usermod -aG docker $USER 

# Currently I compromised. WSL support docker daemon. However, now it doesn't work for Ubuntu 18.06

echo "export DOCKER_HOST=tcp://0.0.0.0:2375" >> ~/.bashrc && source ~/.bashrc

# It doesn't work
# sudo service docker start 



