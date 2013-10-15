#!/bin/bash

inet_aton()
{
    if [ -z "$1" ]; then
	# Return a value that is clearly invalid.  Note that depending on what you're feeding it to, 
	# this might == 255.255.255.255.
	echo -1
	return -1
    fi

    # Only numbers and dots, only dots in the middle, never two dots in a row, and no more than three dots.
    if [[ "$1" =~ [^0-9.] || "$1" =~ ^\\. || "$1" =~ \\.$ || "$1" =~ \\.\\. || "$1" =~ \\..*\\..*\\..*\\. ]]; then
	echo -1
	return -1
    fi

    local val="$1"
    local mult=$((256*256*256))
    local totalval=0
    while [[ "$val" =~ \\. ]]; do
	local thisval=${val%%.*}
	val=${val#*.}
	totalval=$(($totalval+($thisval*$mult)))
	mult=$(($mult/256))
    done
    totalval=$(($totalval+$val))

    if [ $totalval -gt 4294967295 ]; then
	echo -1
	return -1
    fi

    echo $totalval
}

#Usage: inet_aton 127.0.0.1
