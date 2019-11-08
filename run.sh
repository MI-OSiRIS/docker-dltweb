#!/bin/bash

HOSTNAME=`hostname`

cd dlt-web
pm2-runtime server.js
cd -

echo "Container IP : `hostname --ip-address`"
