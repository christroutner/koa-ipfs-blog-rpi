# Raspberry Pi Setup
This document discusses the modifications necessary to run a 'production'
website off a Raspberry Pi mini computer. The directions below assume you
are starting with an RPi v3 B+ with a fresh installation of Raspbian OS.
All instructions below use the command line (terminal), not the graphical
user interface.

## Setup
- Install Docker on the RPi:
```
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
```

- Log out, then back in. Ensure you can run this command to confirm that Docker
is installed and working correctly: `docker ps -a`

- Install Docker Compose:
```
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
```
