#!/bin/bash
docker container run --name ipfs-blog -d \
-p 80:3210 \
-p 6101:6101 \
-v /home/trout/koa-ipfs-blog-rpi/ipfs-data:/home/safeuser/koa-ipfs-blog/ipfs-data \
--restart always \
ipfs-blog
