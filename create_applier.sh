#!/bin/bash
set -eou pipefail

function usage(){
	echo "FATAL: Please enter applier name as argument!"
	exit 1
}


if [ "$#" -ne 1 ]; then
	usage
fi

mkdir $1 
mkdir -p $1/inventory/group_vars params/{ruby,projectrequests} $1/templates/{app,project}
touch $1/inventory/group_vars/all.yml $1/inventory/hosts 
cp -rf roles $1/roles

if [ $? == 0 ]; then
	echo "$1 skeleton created!"
fi
