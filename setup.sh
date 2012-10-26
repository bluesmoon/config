#!/bin/sh

sys=`uname | tr A-Z a-z`

if [ -z "$sys" ]; then
	echo "Unknown Operating System"
	exit
fi

cwd=`pwd`
wd=`dirname $0`


do_distro_check() {
	distro=`lsb_release -a 2>/dev/null | grep 'Distributor ID' | sed -e 's/Distributor ID:        //' | tr A-Z a-z`

	if [ -z "$distro" ]; then
		echo "Unknown Distribution"
		exit
	fi

	if [ -d $wd/$distro ]; then
		cd $wd/$distro
		./setup.sh
		cd $cwd
	else
		echo "Unsupported Distribution"
	fi
			
}

if [ -d $wd/$sys ]; then
	cd $wd/$sys
	./setup.sh
	cd $cwd

	do_distro_check
else
	echo "Unsupported Operating System"
fi

