#!/bin/bash
echo "[K3S] : installing server..."
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1" sh -
sleep 10
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"

while [ ! -e ${NODE_TOKEN} ]
do
    sleep 2
done
echo "[K3S] : creating directories..."
sudo mkdir /vagrant/config
sudo mkdir /vagrant/config/server
echo "[K3S] : Copy server-node-token to (/vagrant/config/server/node-token)"
sudo cp ${NODE_TOKEN} /vagrant/config/server/
echo "[K3S] : Copy k3s.yaml to (/vagrant/config/server/k3s.yaml)"
sudo cp ${KUBE_CONFIG} /vagrant/config/server/

echo "[SETUP ALIAS] : [SETUP] : initiat aliases for all machine users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
sudo echo "alias k=kubectl" >> ~/.bashrc

echo "[machine : $(hostname)] has been setup succefully!"