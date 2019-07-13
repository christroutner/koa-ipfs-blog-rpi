#!/bin/bash
docker container run --name ipfs-blog -d \
-p 3210:3210 \
-p 4001:4001 \
-v /home/trout/ipfs-data:/home/trout/work/personal/koa-ipfs-blog-rpi/production/Dockerfile \
--rm ipfs-blog
