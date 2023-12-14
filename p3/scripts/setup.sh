sudo k3d cluster create p3
#k3d cluster create zamazzalCluster -p "8888:30080"

sudo kubectl cluster-info

sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl get namespace

echo "[ARGOCD] : install argocd and wait for pods to rollout..."
sudo kubectl apply -n argocd -f p3/confs/argo_install.yaml
sudo kubectl apply -n argocd -f p3/confs/argo_ingress.yaml

echo "################################################################################"
echo "[ARGOCD-ROLLOUT] : wait for argocd pods to be running"
sudo kubectl rollout status deployment argocd-server -n argocd
sudo kubectl rollout status deployment argocd-redis -n argocd
sudo kubectl rollout status deployment argocd-repo-server -n argocd
sudo kubectl rollout status deployment argocd-dex-server -n argocd

echo "################################################################################"
echo "[wils-APPLICATION] : setup wils application to fetch its config from our github repo"
sudo kubectl apply -n argocd -f p3/confs/argocd_app1.yaml

echo "############################################################################"
echo "############################## ALL SET !! ##################################"
echo "######################### ARGOCD : localhost:8080 ##########################"
echo "######################### WIL-APP: localhost:8888 ##########################"
echo "############################################################################"