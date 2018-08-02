#!/bin/bash

HOSTNAME=`hostname`

git -C dlt-web stash
git -C dlt-web pull
git -C dlt-web stash pop

cd dlt-web
pm2-runtime  server.js
cd -

echo "Base Station IP : `hostname --ip-address`"
