# ft_Inception_Of_Things. this is not Internet of Things

This project aims to introduce you to kubernetes from a developer perspective. You will have to set up small clusters and discover the mechanics of continuous integration. At the end of this project you will be able to have a working cluster in docker and have a usable continuous integration for your applications.

This project consists of multiple parts.

>Part one: Create a K3S cluster with two VMs launches and create with Vagrant and one in server mode and the other in agent mode. (a lightweight kubernetes).

>Part two orchestrates multiple apps with kubernetes while using as router an ingress, all inside a VM launched with Vagrant.

>Part three synchronizes github repository and kubernetes' running app with argo-cd's automated sync.

All running in a Virtual Machine, in my case UBUNTU

# Ubuntu Virtual Machine:

### configuration.

ISO: https://ubuntu.com/download/desktop/thank-you?version=22.04.3&architecture=amd64

or

ISO: https://ubuntu.com/download/desktop/thank-you?version=16.04.7&architecture=amd64

- NAME: Ubuntu22lts
- RAM: 2048
- Procesadores: 2
- Memoría de video: 128MB
- Network: NAT
- Storage: 20 GB

to enable nested virtualization, (DO IT WITH VM STOPPED)
>VBoxManage modifyvm VM.name --nested-hw-virt on

Install Git

> sudo apt install git

check with:

> git --version

clone repository:

> git clone https://github.com/dperez42/ft_Inception_Of_Things.git inception_of_things

Go to a any scripts path and run setup_ubuntu_vm.sh to install necessary programs and dependencies:
- CURL
- NET-TOOLS
- VIM
- VIRTUALBOX
- VAGRANT
- DOCKER
- KUBECTL
- K3D
- ARGOCD