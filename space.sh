#!/bin/bash

MAX_VALUE=90

ip=$(ifconfig ens160 | grep -w inet | awk '{ print $2 }')


echo "===================$ip======================="


echo "/var usage level "
loc1=/var;du -ax -B1M $loc1 | awk -v minsize=100 '$1 >=minsize { if ( $1 >= 1024 ) printf("%4dG %s\n",$1/1024,$2); else printf("%7dM %s\n",$1,$2)}'


freespace=$(df -h /var | grep / | awk '{ print $5 }' | sed 's/%//g')


if [ "$freespace" -lt "$MAX_VALUE" ]

then
	echo " /var is underthreshold, No action needed "
	echo "/var used percent : $freespace % "
else {

	echo " perform yum clean all to cleanup /var"
	yum clean all
	echo " After housekeeping, /var used percent is $freespace"

	}
fi

