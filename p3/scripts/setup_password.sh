#!/bin/bash
echo $#
if [ $# -ne 1 ]
then 
    printf "\e[0;31m💥 Error to many arguments: usage -> setup_password.sh new_password \n\e[0m"
    exit 1
fi

sudo argocd account bcrypt --password $1 > password.log
echo $(sudo cat password.log)
sudo kubectl -n argocd patch secret argocd-secret -p '{"data": {"admin.password": "'$(sudo cat password.log)'","admin.passwordMtime": "'$(date +%FT%T%Z)'"}}'
sudo rm password.log

printf "\n\e[0;33m####################################"
printf "########## Password update !! ###########"
printf "######🐙 ARGOCD : localhost:8080 ########"
printf "########### User: admin #################"
printf "########### Password: $1 ################"
printf "#########################################\e[0m"
exit 0
