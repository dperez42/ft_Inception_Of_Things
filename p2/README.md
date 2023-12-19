## DESCRIPTION:

Launches with a Vagrantfile with only one VMs (CentOS as operating system) with minimun resources running 3 web aplications:

- 1 CPU
- 512 MB of RAM
- Enable the natdnsproxy1 option.
- Enable the natdnshostresolver1 option.

containing a cluster of K3S (a lightweight kubernetes https://docs.k3s.io/quick-start):

- one in server mode, dedicated IP on the eth1 interface 192.168.56.247

NOTE: Choose ips avalible in your network

K3S (a lightweight kubernetes) to install in server mode

> curl -sfL https://get.k3s.io | sh -

TIPS:
- disable firewalls in VMs to run K3.
- You can sync a folder with a folder host to share information like p.e. node-token.

When a client inputs the ip of the server p.e. 192.168.42.110 in his web browser with the HOST app1.com, the server must display the app1. When the HOST app2.com is used, the server must display the app2. Otherwise, the app3 will be selected by default.

Application number 2 has 3 replicas.
- curl -H "Host:app1.com" 192.168.56.247
- curl -H "Host:app2.com" 192.168.56.247
- curl -H "Host:app3.com" 192.168.56.247
- curl -H "Host:test.com" 192.168.56.247
- curl -H 192.168.56.247

Note: Use the correct IP

## USE:
> Vagrant up

## CHEATSHEET:

Vagrant comands:

to enter via SSH

> vagrant ssh vm_name

K3S comands:
kubectl, crictl, ctr, k3s-uninstall.sh k3s-killall.sh

- kubectl get nodes -o wide
- kubectl get ingresses -A
- kubectl describe ingress -A
- kubectl get all
- kubectl get ns
- kubectl delete --all  pods`
- kubectl get service -o wide
- kubectl delete svc nginx
- kubectl delete deployment yourDeploymentNamenginx
- kubectl get deploy

launch a command in a deployment:

- kubectl exec deploy/mysql-deployment command

For enter in a 

- kubectl exec -it app1-6967497c59-9bj4n -- sh

Kill process in deployments

- kubectl exec deploy/nginx-deployment -- pkill nginx

Other:

You can see information in the enviroment variables. p.e. 

APP4_SERVICE_PORT_80_TCP=tcp://10.43.2.125:80
KUBERNETES_SERVICE_PORT=443
KUBERNETES_PORT=tcp://10.43.0.1:443
HOSTNAME=app1-6967497c59-9bj4n
APP1_SERVICE_SERVICE_PORT_HTTP=80
APP2_SERVICE_SERVICE_PORT_HTTP=80
APP3_SERVICE_SERVICE_PORT_HTTP=80
...

- printenv


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