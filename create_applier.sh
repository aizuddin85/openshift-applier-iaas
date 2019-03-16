#!/bin/bash
set -eou pipefail

function usage(){
	echo "FATAL: Please enter applier name as argument!"
	exit 1
}


if [ "$#" -ne 1 ]; then
	usage
fi

echo "Creating $1 directory..."
mkdir $1 

echo "Creating skeleton directories and files..."
mkdir -p $1/inventory/group_vars params/{ruby,projectrequests} $1/templates/{app,project}
touch $1/inventory/group_vars/all.yml $1/inventory/hosts

echo "Copying openshift-applier installed roles..."
cp -rf roles $1/roles

echo "Copying apply.yml as common entrypoing..."
cp apply.yml $1/apply.yml

if [ $? == 0 ]; then
	echo "$1 skeleton created!"
fi
