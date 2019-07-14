#!/bin/bash
docker container run --name ipfs-blog -d \
-p 3210:3210 \
-p 4001:4001 \
-v /home/trout/koa-ipfs-blog-rpi/ipfs-data:/home/safeuser/koa-ipfs-blog/ipfs-data \
--rm ipfs-blog
