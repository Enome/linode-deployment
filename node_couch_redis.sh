#!/bin/bash

# Install curl
apt-get install -y curl

# Root ssh keys
curl https://raw.github.com/Enome/linode-deployment/master/ssh.sh | sh

# Update apt-get
curl https://raw.github.com/Enome/linode-deployment/master/apt-get.sh | sh

# Dependencies
curl https://raw.github.com/Enome/linode-deployment/master/dependencies.sh | sh

# Git
curl https://raw.github.com/Enome/linode-deployment/master/git.sh | sh

# Node.js
curl https://raw.github.com/Enome/linode-deployment/master/node.sh | sh
