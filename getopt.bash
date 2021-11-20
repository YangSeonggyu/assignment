#!/bin/bash
set -- $(getopt abcs: "$@")

while true;
do
	case "$1" in
	-a)	echo "AAAAAAAAAA" ;;
	-b) echo "BBBBBBBBBB" ;;
	-c) echo "CCCCCCCCCC" ;;
	-s) echo "$2" ;;
	--) break;
	esac
	shift
done
