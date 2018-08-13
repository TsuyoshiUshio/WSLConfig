#!/bin/bash

# install node 8.x as stable
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# path looks windows npm first by default

echo 'PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne '"'"'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));'"'"')' >> ~/.bashrc