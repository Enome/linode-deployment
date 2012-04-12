#!/bin/bash

# Update apt-get
curl https://raw.github.com/Enome/linode-deployment/master/apt-get.sh | sh

# Ssh
curl https://raw.github.com/Enome/linode-deployment/master/ssh.sh | sh

# Dependencies
curl https://raw.github.com/Enome/linode-deployment/master/dependencies.sh | sh

# Git
$(curl https://raw.github.com/Enome/linode-deployment/master/git.sh | sh)

# Node.js
$(curl https://raw.github.com/Enome/linode-deployment/master/node.sh | sh)

# CouchDB
$(curl https://raw.github.com/Enome/linode-deployment/master/couchdb.sh | sh)

# Redis
$(curl https://raw.github.com/Enome/linode-deployment/master/redis.sh | sh)

# Varnish ( reserved proxy )
$(curl https://raw.github.com/Enome/linode-deployment/master/varnish.sh | sh)

# Coffee-script
$(npm install -g coffee-script)

# Firewall

# Deployment
$(curl https://raw.github.com/Enome/linode-deployment/master/add_app.sh > /root/add_app.sh)
chmod +x /root/add_app.sh
