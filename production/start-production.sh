#!/bin/bash

# Ensure the IPFS path is set to the persistent path.
source ~/.profile

ipfs init

sleep 10

nohup ipfs daemon &

sleep 10

ipfs id

sleep 10

# Add any existing data. Help speed up startup.
ipfs add -r /home/safeuser/koa-ipfs-blog/ipfs-data > /dev/null

sleep 5

export KOA_ENV=production
npm start
