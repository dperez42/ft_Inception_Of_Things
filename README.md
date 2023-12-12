# ft_Inception_Of_Things
Use K3d and K3s with Vagrant

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

SSH "https://developer.hashicorp.com/vagrant/docs/vagrantfile/ssh_settings"
vagrant ssh dperez-zS
vagrant ssh-config
ssh 192.168.56.247 --> daniel@192.168.56.248: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

Ssh service is bound to host machine's (i.e: 127.0.0.1) port 2222, but in the VM (guest machine) is still listening on port 22 (as the default port). So, you should connect to port 22 on 192.168.33.10 or 2222 on 127.0.0.1. I.e:

$ ssh -i "<vagranfile-path>/.vagrant/machines/default/virtualbox/private_key" \
-p 22 vagrant@192.168.33.10
or

$ ssh -i "<vagranfile-path>/.vagrant/machines/default/virtualbox/private_key" \
-p 2222 vagrant@127.0.0.1
Also, it is not required to remove ~/.ssh/known_hosts file. Adding the following option will avoid host fingerprint check: -o UserKnownHostsFile=/dev/null


USE NGINX AS INGRESS CONTROLLER

https://kubernetes.github.io/ingress-nginx/ 

$ kubectl get -n kube-system svc | grep traefik
traefik          LoadBalancer   10.43.199.240   192.168.2.248   80:30576/TCP,443:31861/TCP   22h
$ curl http://192.168.2.248:30576  # What is this?
404 page not found
$ kubectl get ingresses -A
No resources found

delete vm from /Users/daniel/VirtualBox VMs