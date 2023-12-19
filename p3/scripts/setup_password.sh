#!/bin/bash
#echo $#
if [ $# -ne 1 ]
then 
    printf "\e[0;31m💥 Error to many arguments: usage -> setup_password.sh new_password \n\e[0m"
    exit 1
fi


echo $(sudo cat password.log)
printf "\e[1;33m[ARGOCD]🐙 : changing admin password to '$1' \n\e[0m "
sudo argocd account bcrypt --password $1 > password.log
sudo kubectl -n argocd patch secret argocd-secret -p '{"stringData": {"admin.password": "'$(sudo cat password.log)'","admin.passwordMtime": "'$(date +%FT%T%Z)'"}}'
sudo rm password.log
#sudo kubectl -n argocd patch secret argocd-secret -p '{"data": {"admin.password": "'$(sudo cat password.log)'","admin.passwordMtime": "'$(date +%FT%T%Z)'"}}'
#sudo rm password.log

printf "\n\e[0;33m####################################\n"
printf "########## Password update !! ###########\n"
printf "######🐙 ARGOCD : localhost:8080 ########\n"
printf "########### User: admin #################\n"
printf "########### Password: $1 ################\n"
printf "#########################################\n\e[0m"
exit 0
