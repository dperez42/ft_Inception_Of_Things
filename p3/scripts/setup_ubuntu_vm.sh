echo "\n\n===============================\n"
echo "=== INSTALL DIFFERENT TOOLS ===\n"
echo "===============================\n\n"

printf "\e[1;33m[UPDATE]💾 : UPDATE/UPGRADE \n\e[0m"
sudo apt update
sudo apt upgrade -y

printf "\e[1;33m[CURL]💾 : Install CURL\n\e[0m"
sudo apt install curl -y

printf "\e[1;33m[NET-TOOLS]💾 : Install NET-TOOLS\n\e[0m"
sudo apt install net-tool

printf "\e[1;33m[VIM]💾 : Install VIM \n\e[0m"
sudo apt install vim -y
echo "\n>> INSTALL VIM\n"

printf "\e[1;33m[VIM]💾 : Install VIRTUALBOX \n\e[0m"
echo "\n>> INSTALL VIRTUALBOX\n"
sudo apt install virtualbox -y
sudo VBoxManage --version

printf "\e[1;33m[VIM]💾: Install VAGRANT \n\e[0m"
sudo wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
sudo chmod +x vagrant_2.2.19_x86_64.deb
sudo apt install ./vagrant_2.2.19_x86_64.deb
sudo rm vagrant_2.2.19_x86_64.deb
sudo vagrant --version

printf "\e[1;36m[DOCKER]🐳 : Install Docker \n\e[0m"
sudo apt install docker.io -y
sudo docker --version

printf "\e[1;35m[KUBECTL]🌈 : Install KUBECTL \n\e[0m"
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

printf "\e[1;32m[K3S]🐋 : Install K3D \n\e[0m"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

printf "\e[1;33m[ARGOCD]🐙 : Install ARGO-CD \n\e[0m "
sudo curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
sudo rm argocd-linux-amd64
argocd version

printf "\e[1;31m[ALIASES]✨ : Creating Aliases. \n\e[0m "
printf "\e[1;36m[DOCKER]🐳 : docker -> d \n\e[0m "
printf "\e[1;35m[KUBECTL]🌈 : kubectl -> k \n\e[0m "
sudo echo "alias d='docker'" >> ~/.bashrc
sudo echo "alias k='kubectl'" >> ~/.bashrc
exec bash # reload .bashrc
# sudo source ~/.bashrc