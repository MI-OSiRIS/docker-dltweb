#!/bin/bash

export PREFIX=/opt


echo "Setting up DLT-WEB..."
cd dlt-web
npm install
sudo npm --log-level=error install -g pm2 bower
bower install
cd -

