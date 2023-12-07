#!/bin/bash
echo "[K3S] : installing agent..."
# check if token exits?
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.247:6443 K3S_TOKEN=$(sudo cat /vagrant/config/server/node-token) sh -
sleep 10
echo "[SETUP ALIAS] : [SETUP] : initiat aliases for all machine users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
sudo echo "alias k=kubectl" >> ~/.bashrc

echo "[machine : $(hostname)] has been setup succefully!"