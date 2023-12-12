# ft_Inception_Of_Things

This project aims to introduce you to kubernetes from a developer perspective. You will have to set up small clusters and discover the mechanics of continuous integration. At the end of this project you will be able to have a working cluster in docker and have a usable continuous integration for your applications.
Use K3d and K3s with Vagrant

This project consists of multiple parts.
>Part one launches VMs containing K3S (a lightweight kubernetes) with Vagrant.
>Part two orchestrates multiple apps with kubernetes while using as router an ingress, all inside a VM launched with Vagrant.
>Part three synchronizes github repository and kubernetes' running app with argo-cd's automated sync.
>The bonus part synchronizes gitlab repository and kubernetes' running app via gitlab CI/CD pipeline and argo-cd's manual sync

Create VM

to nested virtualization
>VBoxManage modifyvm VM.name --nested-hw-virt on

install Virtual Box
do apt-get install virtualbox-ext-pack
sudo apt-get install virtualbox -y

check with
VBoxManage --version
or
virtualbox --help

Install vagrant
sudo apt install vagrant
check:
vagrant --version

Install Git
sudo apt install git
checK:
git --version
