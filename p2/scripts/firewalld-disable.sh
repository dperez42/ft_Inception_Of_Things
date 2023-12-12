#!/bin/bash
printf  "\e[1;31m❗ firewall disable \n\e[0m"
systemctl disable firewalld --now