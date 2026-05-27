#!/bin/bash

	
	usage_per=$(df / | awk ' NR==2 {sub(/%/,"",$5) ;print $5}')

	if [[ $usage_per -gt 80 ]]; then
		echo "WARNING $(date +"%Y-%m-%d %H:%M:%S") - Disk usage at $usage_per%" >> /tmp/monitor.log
	fi


	docker_pid=$(pgrep docker)

	if [[ -z $docker_pid ]]; then
		echo "ALERT $(date +"%Y-%m-%d %H:%M:%S") - Docker process not running" >> /tmp/monitor.log
	fi
	
	sleep 30
