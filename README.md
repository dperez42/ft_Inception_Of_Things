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

K3S "https://docs.k3s.io/quick-start" k3s-uninstall.sh k3s-killall.sh
curl -sfL https://get.k3s.io | sh -
check:
> k3s -v
- Additional utilities will be installed, including kubectl, crictl, ctr, k3s-killall.sh, and k3s-uninstall.sh
- A kubeconfig file will be written to /etc/rancher/k3s/k3s.yaml and the kubectl installed by K3s will automatically use it
- The value to use for K3S_TOKEN is stored at /var/lib/rancher/k3s/server/node-token on your server node. This token will be used for join agents to the cluster
**clear all deployments/pods/services**
`kubectl delete --all  pods`
`k3s kubectl get service -o wide`
`k3s kubectl delete svc nginx`
`k3s kubectl delete deployment yourDeploymentNamenginx`
k3s-killall.sh
kubectl get deploy
launch a command in a deployment:
kubectl exec deploy/mysql-deployment command</br>
For enter in a 
kubectl exec -it app1-6967497c59-9bj4n -- sh
Kill process in deployments
kubectl exec deploy/nginx-deployment -- pkill nginx


CHECKING 
In SERVER NODE:
> vagrant ssh dperez-zS
> kubectl get nodes -o wide
NAME         STATUS   ROLES                  AGE     VERSION
dperez-zsw   Ready    <none>                 3m41s   v1.27.7+k3s2
dperez-zs    Ready    control-plane,master   11m     v1.27.7+k3s2
> ifconfig eth1
eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.247  netmask 255.255.255.0  broadcast 192.168.56.255
        ether 08:00:27:ba:5d:db  txqueuelen 1000  (Ethernet)
        RX packets 215  bytes 39452 (38.5 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 207  bytes 73467 (71.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
In AGENT NODE:
> ifconfig eth1
eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.248  netmask 255.255.255.0  broadcast 192.168.56.255
        ether 08:00:27:90:45:88  txqueuelen 1000  (Ethernet)
        RX packets 1036  bytes 539361 (526.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 857  bytes 140791 (137.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
CHEKING COMUNICATIONS:
ping -c 5 192.168.56.247

kubectl get all
curl -H "Host:app2.com" 192.168.56.247

USE NGINX AS INGRESS CONTROLLER

https://kubernetes.github.io/ingress-nginx/ 

$ kubectl get -n kube-system svc | grep traefik
traefik          LoadBalancer   10.43.199.240   192.168.2.248   80:30576/TCP,443:31861/TCP   22h
$ curl http://192.168.2.248:30576  # What is this?
404 page not found
$ kubectl get ingresses -A
No resources found
# printenv
APP4_SERVICE_PORT_80_TCP=tcp://10.43.2.125:80
KUBERNETES_SERVICE_PORT=443
KUBERNETES_PORT=tcp://10.43.0.1:443
HOSTNAME=app1-6967497c59-9bj4n
APP1_SERVICE_SERVICE_PORT_HTTP=80
APP2_SERVICE_SERVICE_PORT_HTTP=80
APP3_SERVICE_SERVICE_PORT_HTTP=80
HOME=/root
APP4_SERVICE_SERVICE_PORT_HTTP=80
APP1_SERVICE_SERVICE_HOST=1

ERROR vagrant
Error: 
    Error: dyld: Symbol not found: _iconv
    Referenced from: /usr/lib/libcups.2.dylib
    Expected in: /opt/vagrant/embedded/lib/libiconv.2.dylib
    in /usr/lib/libcups.2.dylib
Solution:
        Just find this three files inside /opt/vagrant/embedded/lib/ directory:
            libiconv.2.dylib
            libxml2.2.dylib
            libxslt.1.dylib
        And remove them or rename to _....dylib
Error:
delete vm from /Users/daniel/VirtualBox VMs