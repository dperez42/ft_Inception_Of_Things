echo "\n\n===============================\n"
echo "=== INSTALL DIFFERENT TOOLS ===\n"
echo "========== https://ubuntu.com/download/desktop/thank-you?version=22.04.3&architecture=amd64 =====================\n\n"

echo "\n>> UPDATE / UPGRADE\n"
sudo apt update
sudo apt upgrade -y

echo "\n>> INSTALL MAKE\n"
sudo apt install make -y

echo "\n>> INSTALL CURL\n"
sudo apt install curl -y

echo "\n>> INSTALL VIM\n"
sudo apt install vim -y

echo "\n>> INSTALL XSEL\n"
sudo apt install xsel -y

echo "\n>> INSTALL GH\n"
sudo apt install gh -y

echo "\n>> INSTALL VIRTUALBOX\n"
sudo apt install virtualbox-ext-pack
sudo apt install virtualbox -y
sudo vVBoxManage --version

echo "\n>> INSTALL DOCKER\n"
sudo apt install docker.io -y
sudo docker --version

echo "\n>> INSTALL KUBECTL\n"
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client