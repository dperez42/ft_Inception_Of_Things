#!/bin/bash
# echo $#
if [ $# -ne 3 ]
then 
    printf "\e[0;31m💥 Error to many arguments: usage -> K3s-install-agent.sh SERVER_IP SERVER_TOKEN AGENT_IP \n\e[0m"
    exit 1
fi

printf "\e[1;36m🐳  [K3S] : installing agent in IP $3 connect with K3S server in IP: $1 with token: $2 ...\n\e[0m"
curl -sfL https://get.k3s.io | K3S_URL=https://$1:6443 K3S_TOKEN=$2 INSTALL_K3S_EXEC="--node-ip=$3" sh -s -
# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.42.110:6443 --token-file /vagrant/scripts/node-token --node-ip=192.168.42.111" sh -
sleep 3

printf "\e[1;36m[SETUP ALIAS] : created aliases for all machine users \n\e[0m"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
# 1º Method.
echo "alias k='kubectl'" >> .bashrc
source ~/.bashrc # reload .bashrc to get new aliases, 'source ~/.bashrc' = '. ~/.bashrc' source 

# 2º Method.
# add alias for kubectl command
#echo "alias e='echo'" > /etc/profile.d/00.aliases.sh

printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m "

printf "\e[0;32m 🚀 [machine : $(hostname)] has been setup succefully in K3S agent mode!"