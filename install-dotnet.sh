#!/bin/bash

# https://www.microsoft.com/net/download/thank-you/dotnet-sdk-2.1.302-linux-x64-binaries
# You need to put dotnet-sdk-2.1.302-linux-x64.tar.gz on your machine 
cp /mnt/c/Users/tsushi/Codes/WSL/dotnet-sdk-2.1.302-linux-x64.tar.gz .
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-2.1.302-linux-x64.tar.gz -C $HOME/dotnet

echo 'export DOTNET_ROOT=$PATH:$HOME/dotnet' >> ~/.bashrc 
echo 'export PATH=$PATH:$HOME/dotnet' >> ~/.bashrc && source ~/.bashrc
