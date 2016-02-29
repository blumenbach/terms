#!/bin/sh

for url in "$@"; do
HTTP_STATUS="$(curl -IL --silent "$url" | grep HTTP )";
     	empty_space=$empty_space' '
	status=$url$empty_space${HTTP_STATUS}
	echo "$status" >> "status.txt"
done
