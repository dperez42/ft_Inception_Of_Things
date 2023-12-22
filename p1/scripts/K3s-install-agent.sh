#!/bin/bash
echo $#
if [ $# -ne 1 ]
then 
    printf "\e[0;31m💥 Error to many arguments: usage -> K3s-install-agent.sh 123.123.123.123 \n\e[0m"
    exit 1
fi

printf "\e[1;36m🐳  [K3S] : installing agent...\n\e[0m"
# check if token exits?
curl -sfL https://get.k3s.io | K3S_URL=https://$1:6443 K3S_TOKEN=$(sudo cat /vagrant/config/server/node-token) sh -
sleep 10
echo "[SETUP ALIAS] : [SETUP] : initiat aliases for all machine users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
sudo echo "alias k=kubectl" >> ~/.bashrc
exec bash # reload .bashrc
printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m "

printf "\e[0;32m 🚀 [machine : $(hostname)] has been setup succefully in K3S agent mode!"