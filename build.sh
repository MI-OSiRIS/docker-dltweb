#!/bin/bash

export PREFIX=/opt

echo "Setting up DLT-WEB..."
cd dlt-web
sudo npm install yarn pm2 -g
yarn install
cd -
