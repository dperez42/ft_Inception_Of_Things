sudo argocd account bcrypt --password admin > password.log
sudo kubectl -n argocd patch secret argocd-secret -p '{"stringData": {"admin.password": "'$(sudo cat password.log)'","admin.passwordMtime": "'$(date +%FT%T%Z)'"}}'
#sudo rm password.log

printf "\e[0;33m url : https://localhost:8080 \n"
printf "user: admin"
echo -n "password: "
sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo "\n"

printf "\n\e[0;33m############################################################################"
printf "############################## ALL SET !! ##################################"
printf "######################### ARGOCD : localhost:8080 ##########################"
printf "######################### WIL-APP: localhost:8888 ##########################"
printf "############################################################################ \e[0m"
printf "\e[1;33m[wils-APPLICATION] : setup wils application to fetch its config from our github repo  \n\e[0m "