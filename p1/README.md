## DESCRIPTION:

Launches with a Vagrantfile 2 VMs (CentOS as operating system) with minimun resources:

- 1 CPU
- 512 MB of RAM
- Enable the natdnsproxy1 option.
- Enable the natdnshostresolver1 option.
- networking in vms:

        --natdnsproxy<1-N> on|off: Makes the NAT engine proxy all guest DNS requests to the host's DNS servers. See Section 9.8.5, “Enabling DNS Proxy in NAT Mode”.

        --natdnshostresolver<1-N> on|off: Makes the NAT engine use the host's resolver mechanisms to handle DNS requests. See Section 9.8.6, "Using the Host's Resolver as a DNS Proxy in NAT Mode".

<img height="250em" src="https://i.stack.imgur.com/rRfpM.png"/>

### Installing a K3S Cluster

K3S is a lightweight kubernetes https://docs.k3s.io/quick-start:

- one in server mode, dedicated IP on the eth1 interface 192.168.42.110

        curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --flannel-iface eth1 --token 12345 " sh -s -

- the other in agent mode, dedicated IP on the eth1 interface 192.168.42.111

In order to add K3S agent node, run the installation script with the K3S_URL and K3S_TOKEN environment variables. The K3s agent will register with the K3s server listening at the supplied URL.

Here is an example showing how to join an agent:

        curl -sfL https://get.k3s.io | K3S_URL=https://SERVER_IP:6443 K3S_TOKEN=12345 INSTALL_K3S_EXEC="--node-ip=AGENT_IP" sh -s -

NOTE: Choose ips avalible in your network

NOTE: If you not define the token, K3S will create one and the value to use for K3S_TOKEN is stored at /var/lib/rancher/k3s/server/node-token on your server node or your could define yourself with the flag '--token' when server is created. 

<img height="500em" src="https://docs.k3s.io/assets/images/how-it-works-k3s-revised-9c025ef482404bca2e53a89a0ba7a3c5.svg"/>

TIPS:
- disable firewalls in VMs to run K3s. systemctl disable firewalld --now
- You can sync a folder with a folder host to share information like p.e. node-token.

## USE:

        vagrant up

Enter in the vm server with:

        vagrant ssh dperez-zS

and see the status of the K3s cluster with:

        kubectl get nodes -o wide'
        
you will see the two vm machines.


## CHEATSHEET:

# Vagrant commands:

to enter via SSH. Also to see ssh configuration (vagrant ssh-config vm_name)

        vagrant ssh vm_name

to create a default Vagranfile

        vagrant init

to run provision script on a running vm

        vagrant provision

to list the boxes loaded in the system. other commands(vagrant box add/list/outdated/prune/remove/repackage/update)

        vagrant box list


# K3S commands:

kubectl, crictl, ctr, k3s-uninstall.sh k3s-killall.sh

In server node:

        kubectl get nodes -o wide

NAME         STATUS   ROLES                  AGE     VERSION

dperez-zsw   Ready    <none>                 3m41s   v1.27.7+k3s2

dperez-zs    Ready    control-plane,master   11m     v1.27.7+k3s2


        ifconfig eth1

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.247  netmask 255.255.255.0  broadcast 192.168.56.255
        ether 08:00:27:ba:5d:db  txqueuelen 1000  (Ethernet)
        RX packets 215  bytes 39452 (38.5 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 207  bytes 73467 (71.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

In agent node:

        ifconfig eth1

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.248  netmask 255.255.255.0  broadcast 192.168.56.255
        ether 08:00:27:90:45:88  txqueuelen 1000  (Ethernet)
        RX packets 1036  bytes 539361 (526.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 857  bytes 140791 (137.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Others comands:

- kubectl get all
- kubectl get ns
- kubectl delete --all  pods`
- kubectl get service -o wide
- kubectl delete svc nginx
- kubectl delete deployment yourDeploymentNamenginx
- kubectl get deploy

launch a command in a deployment:

- kubectl exec deploy/mysql-deployment 

For enter in a pod

- kubectl exec -it app1-6967497c59-9bj4n -- sh

Kill process in deployments

- kubectl exec deploy/nginx-deployment -- pkill nginx

## ERRORS:

### VAGRANT

Error: dyld: Symbol not found: _iconv
    Referenced from: /usr/lib/libcups.2.dylib
    Expected in: /opt/vagrant/embedded/lib/libiconv.2.dylib
    in /usr/lib/libcups.2.dylib

Solution: 

Just find this three files inside /opt/vagrant/embedded/lib/ directory:

- libiconv.2.dylib
- libxml2.2.dylib
- libxslt.1.dylib
- And remove them or rename to _....dylib