#!/bin/bash

# Update apt-get
curl https://raw.github.com/Enome/linode-deployment/master/apt-get.sh | sh

# Dependencies
curl https://raw.github.com/Enome/linode-deployment/master/dependencies.sh | sh

# Git
curl https://raw.github.com/Enome/linode-deployment/master/git.sh | sh

# Node.js
curl https://raw.github.com/Enome/linode-deployment/master/node.sh | sh

# CouchDB
curl https://raw.github.com/Enome/linode-deployment/master/couchdb.sh | sh

# Redis
curl https://raw.github.com/Enome/linode-deployment/master/redis.sh | sh

# Deployment
curl https://raw.github.com/Enome/linode-deployment/master/deployment.sh | sh
