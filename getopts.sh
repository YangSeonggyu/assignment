#!/bin/bash

help() {
	echo "$0 [option]"
		echo "	-h			도움말 출력"
		echo "	-a [arguments]		인자 값 출력"
		echo "	-l [경로]		경로 목록"
}
while getopts "a:l:h" opt
do
	case $opt in
		a)	arg_a=$OPTARG
			echo "Arg A: $arg_a"
			;;
		l)	arg_b=$OPTARG
			ls -al $arg_b
			;;
		h) help ;;
		?) help ;;
	esac
done

