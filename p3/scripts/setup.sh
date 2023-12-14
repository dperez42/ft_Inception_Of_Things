sudo k3d cluster create p3
k3d cluster create zamazzalCluster -p "8888:30080"

kubectl cluster-info

kubectl create namespace argocd
kubectl create namespace dev
kubectl get namespace

echo "[ARGOCD] : install argocd and wait for pods to rollout..."
sudo kubectl apply -n argocd -f ../confs/argo_install.yaml