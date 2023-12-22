#!/bin/bash
printf "\e[1;36m🐳  [K3S]: installing server...\n\e[0m"
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
sleep 10
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"

while [ ! -e ${NODE_TOKEN} ]
do
    printf "\e[1;36m🐳  [K3S]: waiting for server token...\n\e[0m"
    sleep 2
done
printf "\e[1;36m🐳  [K3S]: creating directories...\n\e[0m"
sudo mkdir /vagrant/config
sudo mkdir /vagrant/config/server
printf "\e[1;36m🐳  [K3S]: Copy server-node-token to share folder (/vagrant/config/server/node-token)\n\e[0m"
sudo cp ${NODE_TOKEN} /vagrant/config/server/
printf "\e[1;36m🐳  [K3S]: Copy k3s.yaml to share folder (/vagrant/config/server/k3s.yaml)\n\e[0m"
sudo cp ${KUBE_CONFIG} /vagrant/config/server/

echo "[SETUP ALIAS] : [SETUP] : init aliases for all machine users\n\e[0m"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
sudo echo "alias k='kubectl'" >> ~/.bashrc
exec bash # reload .bashrc
printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m "

printf "\e[0;32m 🚀 [machine : $(hostname)] has been setup succefully in K3S server mode!\n\e[0m"