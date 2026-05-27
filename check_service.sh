#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: check_service.sh <service_name>"
fi

service=$(systemctl show -p ActiveState "$1" | awk -F= '{print $2}')

if [[ $service == "inactive" ]]; then
	echo -e "\e[1;31mCRITICAL\e[0m: $1 is not running"
elif [[ $service == "active" ]]; then
	echo -e "\e[1;32mOK\e[0m: $1 is running"
fi
