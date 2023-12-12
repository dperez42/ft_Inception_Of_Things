#!/bin/bash
printf "\e[1;36m🐳  Installing Docker in Centos 8\n\e[0m"
printf "\e[1;36m🐳  Removing older versions \n\e[0m"
sudo dnf remove docker docker-latest docker-engine docker-client docker-common docker-client-latest docker-logrotate docker-latest-logrotate
sudo dnf check-update
sudo dnf upgrade
printf "\e[1;36m🐳  Set up the repository \n\e[0m"
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
printf "\e[1;36m🐳  Install Docker Engine \n\e[0m"
sudo dnf install docker-ce --nobest --allowerasing -y
printf "\e[1;36m🐳  Starting Docker Daemon \n\e[0m"
sudo systemctl start docker
printf "\e[1;36m🐳  Enable the Docker daemon on the system boot to start at the boot time \n\e[0m"
sudo systemctl enable docker
printf "\e[1;36m🐳 : Docker installed and started \n\e[0m"
docker -v