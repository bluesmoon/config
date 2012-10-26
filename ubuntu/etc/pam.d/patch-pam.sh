#!/bin/bash

FILES="common-session common-session-noninteractive"

for f in $FILES; do
	f="/etc/pam.d/$f"
	if grep "^session[ 	][ 	]*required[ 	][ 	]*pam_limits\.so\>" $f &>/dev/null; then
		echo "$f OK"
	else
		echo "" >> $f
		echo "# Added by patch-pam.sh from https://github.com/lognormal/config" >> $f
		echo "session	required	pam_limits.so" >> $f
		echo "# End" >> $f
	fi
done
