#!/bin/bash
# This script initializes a Raspberry Pi with a freshly installed copy of
# Raspbian. It removes a lot of software that will not be needed and updates
# the operating system.

# Removed unneeded stock software
sudo apt-get --purge -y remove libreoffice libreoffice-avmedia-backend-gstreamer \
libreoffice-base libreoffice-base-core libreoffice-base-drivers libreoffice-calc \
libreoffice-common libreoffice-core libreoffice-draw libreoffice-gtk \
libreoffice-impress libreoffice-java-common libreoffice-math \
libreoffice-report-builder-bin libreoffice-sdbc-hsqldb libreoffice-style-galaxy \
libreoffice-writer bluej wolfram-engine scratch geany geany-common greenfoot \
sonic-pi minecraft-pi chromium-browser

# Remove unneeded dependencies
sudo apt-get -y autoremove
