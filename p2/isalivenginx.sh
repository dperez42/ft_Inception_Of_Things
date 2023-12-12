#!/bin/ash
ps -ef | grep nginx | wc -l
return_nginx=$?
if [ $return_nginx = 0]; then
	exit 0
else
	exit 1
fi