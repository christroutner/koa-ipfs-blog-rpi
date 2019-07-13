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
#VOLUME /home/safeuser/.ipfs
WORKDIR /home/safeuser

# ARM & Raspberry Pi
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.21/go-ipfs_v0.4.21_linux-arm.tar.gz
RUN tar -xvf go-ipfs_v0.4.21_linux-arm.tar.gz
RUN rm go-ipfs_v0.4.21_linux-arm.tar.gz

WORKDIR /home/safeuser/go-ipfs
# Prep 'sudo' commands.
RUN echo 'abcd8765' | sudo -S pwd
RUN sudo ./install.sh

# Clone the project
WORKDIR /home/safeuser
RUN git clone https://github.com/christroutner/koa-ipfs-blog

# Switch to the desired branch. `master` is usually stable,
# and `stage` has the most up-to-date changes.
WORKDIR /home/safeuser/koa-ipfs-blog

# Copy the config file, which determins the internal port and the BCH address
# to monitor.
COPY common.js config/env/common.js

# Install dependencies
RUN npm install

# Alter the IPFS to a the mounted volume.
RUN echo "export IPFS_PATH=/home/safeuser/koa-ipfs-blog/ipfs-data" >> /home/safeuser/.profile

# Declare the path to volumes for persisting data.
VOLUME /home/safeuser/koa-ipfs-blog/ipfs-data

# Expose the port the API will be served on.
EXPOSE 3210
EXPOSE 4001

# Start the application.
COPY start-production.sh start-production.sh
CMD ["./start-production.sh"]

#CMD ["npm", "start"]
