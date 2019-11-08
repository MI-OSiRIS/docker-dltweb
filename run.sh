#!/bin/bash

HOSTNAME=`hostname`

cd dlt-web
sudo service mongodb start
pm2-runtime server.js
cd -

echo "Container IP : `hostname --ip-address`"
