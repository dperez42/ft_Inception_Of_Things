# ft_Inception_Of_Things
Use K3d and K3s with Vagrant

Create VM

to nested virtualization
>VBoxManage modifyvm VM.name --nested-hw-virt on

install Virtual Box
sudo apt-get install virtualbox-ext-pack
sudo apt instal virtualbox -y

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

K3S "https://docs.k3s.io/quick-start"
curl -sfL https://get.k3s.io | sh -
check:
> k3s -v
- Additional utilities will be installed, including kubectl, crictl, ctr, k3s-killall.sh, and k3s-uninstall.sh
- A kubeconfig file will be written to /etc/rancher/k3s/k3s.yaml and the kubectl installed by K3s will automatically use it
- The value to use for K3S_TOKEN is stored at /var/lib/rancher/k3s/server/node-token on your server node. This token will be used for join agents to the cluster

ADDING AGENTS
To install additional agent nodes and add them to the cluster, run the installation script with the K3S_URL and K3S_TOKEN environment variables. Here is an example showing how to join an agent:
> curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
Setting the K3S_URL parameter causes the installer to configure K3s as an agent, instead of a server. The K3s agent will register with the K3s server listening at the supplied URL. The value to use for K3S_TOKEN is stored at /var/lib/rancher/k3s/server/node-token on your server node.


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