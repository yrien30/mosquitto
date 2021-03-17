#!/bin/sh

status_code=$(curl --write-out '%{http_code}' --silent --output /dev/null https://yrielectro.com/PreUpdate.php)
if [ $status_code = 200 ]
then
    exit 0
fi

if [ $status_code = 503 ]
then
    exit 1
fi

if [ $status_code = 401 ]
then
    exit 75
fi


