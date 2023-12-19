echo "\n\n===============================\n"
echo "=== INSTALL DIFFERENT TOOLS ===\n"
echo "===============================\n\n"

printf "\e[1;33m[UPDATE]💾: UPDATE/UPGRADE \n\e[0m"
sudo apt update
sudo apt upgrade -y

printf "\e[1;33m[CURL]💾: Install CURL\n\e[0m"
echo "\n>> INSTALL CURL\n"
sudo apt install curl -y

printf "\e[1;33m[NET-TOOLS]💾: Install NET-TOOLS\n\e[0m"
echo "\n>> INSTALL NET-TOOLS\n"
sudo apt install net-tool

printf "\e[1;33m[VIM]💾: Install VIM \n\e[0m"
sudo apt install vim -y
echo "\n>> INSTALL VIM\n"

printf "\e[1;36m[DOCKER]🐳 : Install Docker \n\e[0m"
sudo apt install docker.io -y
sudo docker --version

printf "\e[1;35m[KUBECTL]🌈 : Install KUBECTL \n\e[0m"
echo "\n>> INSTALL KUBECTL\n"
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

printf "\e[1;32m[K3S]🐋 : Install K3D \n\e[0m"
echo "\n>> INSTALL K3D\n"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

printf "\e[1;33m[ARGOCD]🐙 : Install ARGO-CD \n\e[0m "
sudo curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
argocd version

#echo "\n>> INSTALL HELM\n"
#curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
#chmod 700 get_helm.sh
#sudo ./get_helm.sh
#sudo rm get_helm.sh

#echo "\n>> ADD HOST IN /ETC/HOSTS\n"
#echo "192.168.56.110 app1.com" | sudo tee -a /etc/hosts
#echo "192.168.56.112 gitlab.local" | sudo tee -a /etc/hosts
#echo "192.168.56.110 app2.com" | sudo tee -a /etc/hosts