#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: check_service.sh <service_name>"
	exit 2
fi

service=$(systemctl show -p ActiveState "$1" | awk -F= '{print $2}')

if ! systemctl cat "$1" &>/dev/null; then
	echo -e "\e[1;31mUNKNOWN\e[0m: $1 does not exist"
    exit 3
fi

if [[ $service == "inactive" ]]; then
	echo -e "\e[1;31mCRITICAL\e[0m: $1 is not running"
	exit 1
elif [[ $service == "active" ]]; then
	echo -e "\e[1;32mOK\e[0m: $1 is running"
	exit 0
fi
