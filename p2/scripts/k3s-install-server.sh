#!/bin/bash

if [ $# -ne 2 ]
then 
    printf "\e[0;31m💥 Error incorrect number of arguments: usage -> k3s-install-server.sh SERVER_IP SERVER_TOKEN \n\e[0m"
    exit 1
fi

printf "\e[1;36m[K3S]🐳 : Installing K3S. IP: $1, TOKEN: $2 \n\e[0m"
#export INSTALL_K3S_EXEC="server --no-deploy traefik --write-kubeconfig-mode=644"
#curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface eth1 server --no-deploy traefik" sh -
#curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--tls-san $1 --node-ip $1 --flannel-iface=eth1" sh -
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --flannel-iface eth1 --node-ip $1 --token $2" sh -s -
sleep 3

printf "\e[1;35m[SETUP ALIAS] : created aliases for all machine users \n\e[0m"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
# 1º Method.
echo "alias k='kubectl'" >> .bashrc
source ~/.bashrc # reload .bashrc to get new aliases, 'source ~/.bashrc' = '. ~/.bashrc' source 

# 2º Method.
# add alias for kubectl command
#echo "alias e='echo'" > /etc/profile.d/00.aliases.sh

printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m"

#DEPLOY DEPLOYS
printf "\e[1;36m[K3S]🐳 : Deploying deploys  \n\e[0m"
deploys="app1 app2 app3"
for deploy in $deploys
do
	printf "\e[1;36m[K3S]🐳 : Deploying [$deploy]\n\e[0m"
	sudo /usr/local/bin/kubectl apply -f /vagrant/confs/$deploy/"$deploy"-deploy.yaml #> /dev/null
	# restart, then wait using 'rollout status'
	printf "\e[1;36m[K3S]🐳 : Waiting for ready\n\e[0m"
	sudo /usr/local/bin/kubectl rollout restart deployment $deploy -n default
	sudo /usr/local/bin/kubectl rollout status deployment $deploy -n default --timeout=180s #--timeout=-1s = 1 week
done
#DEPLOY SERVICES
printf "\e[1;36m[K3S]🐳 : Deploying Services  \n\e[0m"
services="app1 app2 app3"
for service in $services
do
	printf "\e[1;36m[K3S]🐳 : Deploy service [$service]\n\e[0m"
	sudo /usr/local/bin/kubectl apply -f /vagrant/confs/$service/"$service"-service.yaml #> /dev/null
done
#DEPLOY INGRESS
printf "\e[1;36m[K3S]🐳 : Deploying Ingress \n\e[0m"
ingresses="app1 app2 app3"
for ingress in $ingresses
do
	printf "\e[1;36m[K3S]🐳 : Deploy ingress [$ingress]\n\e[0m"
	sudo /usr/local/bin/kubectl apply -f /vagrant/confs/$ingress/"$ingress"-ingress.yaml #> /dev/null
done
printf "\e[1;36m[K3S]🐳 : Waiting for pods ready\n\e[0m"
sudo /usr/local/bin/kubectl wait --all --for=condition=Ready pods --timeout=180s #--timeout=-1s = 1 week

/usr/local/bin/kubectl get all
printf "\e[1;36m[K3S]🐳 : K3S cluster running in [machine : $(hostname)]\n\e[0m"