sudo k3d cluster create p3
#k3d cluster create zamazzalCluster -p "8888:30080"

sudo kubectl cluster-info

sudo kubectl create namespace argocd
sudo kubectl create namespace dev
sudo kubectl get namespace
printf "\e[1;33m[ARGOCD]🐙 : Installing K3S.\n\e [0m"
echo "[ARGOCD] : install argocd and wait for pods to rollout..."
sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_install.yaml
sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_ingress.yaml

printf "\e[1;33m[ARGOCD]🐙 : wait for argocd pods to be running [0m"
sudo kubectl rollout status deployment argocd-server -n argocd
sudo kubectl rollout status deployment argocd-redis -n argocd
sudo kubectl rollout status deployment argocd-repo-server -n argocd
sudo kubectl rollout status deployment argocd-dex-server -n argocd

printf "\e[1;33m[wils-APPLICATION] : setup wils application to fetch its config from our github repo [0m "
sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_app1.yaml

sudo kubectl apply -n argocd -f /p3/p3/confs/argocd_app1.yaml
printf "\e[1;33m############################################################################"
printf "############################## ALL SET !! ##################################"
printf "######################### ARGOCD : localhost:8080 ##########################"
printf "######################### WIL-APP: localhost:8888 ##########################"
printf "############################################################################ [0m"