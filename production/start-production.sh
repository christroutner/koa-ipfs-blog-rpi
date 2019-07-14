#!/bin/bash

# Change the ownership of the persistant volue to ensure this app can
# write to it.
echo 'abcd8765' | sudo -S pwd
sudo chown -R safeuser /home/safeuser/koa-ipfs-blog/ipfs-data

# Ensure the IPFS path is set to the persistent path.
source ~/.profile

ipfs init

sleep 10

nohup ipfs daemon &

sleep 10

ipfs id

sleep 10

# Add any existing data. Help speed up startup.
#ipfs add -r /home/safeuser/koa-ipfs-blog/ipfs-data > /dev/null
# NOTE NEEDED: This grows the ipfs-data directory every time the container is started.

sleep 5

export KOA_ENV=production
npm start
