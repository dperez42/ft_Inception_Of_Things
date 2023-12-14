sudo k3d cluster create p3
k3d cluster create zamazzalCluster -p "8888:30080"

kubectl cluster-info

kubectl create namespace argocd
kubectl create namespace dev
kubectl get namespace

sudo kubectl apply -n argocd -f ../confs/argo_install.yaml