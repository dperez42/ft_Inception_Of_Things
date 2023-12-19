
Create a virtual machine:

ubuntu-22.04.3-desktop-amd64.iso
Ubuntu (64 bits)
RAM: 2048 mb
PROCESSORS: 2
VIDEO MEMORY: 128 mb
STORAGE: 30 GB
NETWORK ADAPTER: bridge


sudo apt update 
sudo apt upgrade -y

sudo apt install git
git --version



1.- Create the cluster

sudo k3d cluster create p3

2.- Create two namespace: dev, argocd

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

3.- Install Argocd in the namespace: argocd

sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_install.yaml
sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_ingress.yaml

argocd_install.yaml y argocd_ingress.yaml is download from https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

4.- Get user y password of ArgoCD

echo "url : https://localhost:8080"
echo "user: admin"
echo -n "password: "
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo ""



5.-  make ARGOCD UI accesible from "url : https://localhost:8080"

two ways:

>Change the argocd-server service type to LoadBalancer:
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

>Port Forwarding

Kubectl port-forwarding can also be used to connect to the API server without exposing the service.

nohup sudo kubectl port-forward svc/argocd-server -n argocd 8080:443 >> argocdlogs.log 2>&1 & 
user: admin

The API server can then be accessed using https://localhost:8080

> With Ingress, see https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/

https://argo-cd.readthedocs.io/en/stable/getting_started/

6.- setup our your aplication in ArgoCD:

sudo kubectl apply -f /p3/p3/confs/argocd_app1.yaml

CHEETSHEET

k3d cluster create
k3d cluster delete
k3d cluster list
k3d cluster start
k3d cluster stop

https://argo-cd.readthedocs.io/en/stable/getting_started/

argocd login localhost:8080 
argocd app list
argocd app get app_argocd_name  
argocd app sync app_argocd_name


argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default


apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd-wilapp
  namespace: argocd
spec:
  destination:
    namespace: dev
    server: https://kubernetes.default.svc
  project: default
  source:
    repoURL: https://github.com/zamazzal/iot-app.git
    path: .
    targetRevision: master
  syncPolicy:
    prune: true
    selfHeal: true


argocd app get guestbook  (view status of app)
Name:               guestbook
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://10.97.164.88/applications/guestbook
Repo:               https://github.com/argoproj/argocd-example-apps.git
Target:
Path:               guestbook
Sync Policy:        <none>
Sync Status:        OutOfSync from  (1ff8a67)
Health Status:      Missing

argocd app sync guestbook (sync manually, This command retrieves the manifests from the repository and performs a kubectl apply of the manifests.)