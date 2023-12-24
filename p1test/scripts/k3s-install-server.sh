#!/bin/bash

if [ $# -ne 1 ]
then 
    printf "\e[0;31m💥 Error incorrect number of arguments: usage -> k3s-install.sh your_token \n\e[0m"
    exit 1
fi

printf "\e[1;36m🐳  [K3S]: installing server...\n\e[0m"

#curl -fL https://get.k3s.io | INSTALL_K3S_VERSION=v1.24.17+k3s1 sh -s - server
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --flannel-iface eth1 --token $1" sh -s -
sleep 10

echo "[SETUP ALIAS] : [SETUP] : init aliases for all machine users\n\e[0m"
sudo echo "alias k='kubectl'" >> ~/.bashrc
exec bash # reload .bashrc
printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m "

printf "\e[0;32m 🚀 [machine : $(hostname)] has been setup succefully in K3S server mode!\n\e[0m"