#!/bin/sh -x

# The things you have to do to get a bit of CFLAGS support...


if grep -q COPTS site.conf; then
	echo "site.conf has already been modified"
	case $1 in
		"unpatch")
			grep -v COPTS site.conf > /tmp/site.conf
			mv -f /tmp/site.conf site.conf
		;;
	esac
else
	echo "site.conf requires modification"
	case $1 in
		"patch")
			echo "COPTS = \$(BINDDEF) \$(CC_OPTIONS) $CFLAGS" >> site.conf
		;;
	esac
fi
