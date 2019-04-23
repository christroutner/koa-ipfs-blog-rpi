# Create a Dockerized API server
#

#IMAGE BUILD COMMANDS
# ct-base-ubuntu = ubuntu 18.04 + nodejs v10 LTS
# https://github.com/christroutner/docker-base/blob/master/Dockerfile
FROM christroutner/rpi-docker-base
MAINTAINER Chris Troutner <chris.troutner@gmail.com>

#Set the working directory to be the home directory
WORKDIR /home/safeuser

# Used for debugging when there are issues.
COPY dummyapp.js dummyapp.js

# Switch to user account.
USER safeuser

# Debug
#WORKDIR /home/safeuser
#CMD ["node", "dummyapp.js"]


# Install IPFS
VOLUME /home/safeuser/.ipfs
WORKDIR /home/safeuser

# ARM & Raspberry Pi
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.20/go-ipfs_v0.4.20_linux-arm.tar.gz
RUN tar -xvf go-ipfs_v0.4.20_linux-arm.tar.gz
RUN rm go-ipfs_v0.4.20_linux-arm.tar.gz

WORKDIR /home/safeuser/go-ipfs
# Prep 'sudo' commands.
RUN echo 'abcd8765' | sudo -S pwd
RUN sudo ./install.sh

# Clone the rest.bitcoin.com repository
WORKDIR /home/safeuser
RUN git clone https://github.com/christroutner/koa-ipfs-blog

# Switch to the desired branch. `master` is usually stable,
# and `stage` has the most up-to-date changes.
WORKDIR /home/safeuser/koa-ipfs-blog

# Install dependencies
RUN npm install

VOLUME /home/safeuser/koa-ipfs-blog/ipfs-data

# Expose the port the API will be served on.
EXPOSE 3210
EXPOSE 4001

# Start the application.
COPY start-production start-production
CMD ["./start-production"]

#CMD ["npm", "start"]
