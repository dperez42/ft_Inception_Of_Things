## DESCRIPTION:

Launches 2 VMs containing K3S (a lightweight kubernetes https://docs.k3s.io/quick-start), one in server mode and the other in agent mode, with Vagrant.

K3S (a lightweight kubernetes) to install in server mode

> curl -sfL https://get.k3s.io | sh -

In order to add K3S agent node, run the installation script with the K3S_URL and K3S_TOKEN environment variables. Here is an example showing how to join an agent:

> curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -

Setting the K3S_URL parameter causes the installer to configure K3s as an agent, instead of a server. The K3s agent will register with the K3s server listening at the supplied URL. The value to use for K3S_TOKEN is stored at /var/lib/rancher/k3s/server/node-token on your server node.

## CHEATSHEET:
Vagrant commands:
> vagrant ssh vm_name to enter by ssh
K3S commands:
kubectl, crictl, ctr, k3s-uninstall.sh k3s-killall.sh

In server node:
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
In agent node:
> ifconfig eth1
eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.248  netmask 255.255.255.0  broadcast 192.168.56.255
        ether 08:00:27:90:45:88  txqueuelen 1000  (Ethernet)
        RX packets 1036  bytes 539361 (526.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 857  bytes 140791 (137.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

kubectl get all
curl -H "Host:app2.com" 192.168.56.247
kubectl delete --all  pods`
k3s kubectl get service -o wide
k3s kubectl delete svc nginx
k3s kubectl delete deployment yourDeploymentNamenginx
k3s-killall.sh
kubectl get deploy
launch a command in a deployment:
kubectl exec deploy/mysql-deployment command
For enter in a 
kubectl exec -it app1-6967497c59-9bj4n -- sh
Kill process in deployments
kubectl exec deploy/nginx-deployment -- pkill nginx



## ERRORS:

### VAGRANT

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