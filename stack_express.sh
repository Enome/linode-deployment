#!/bin/bash

# Update apt-get
curl https://raw.github.com/Enome/linode-deployment/master/apt-get.sh | sh

# Ssh
curl https://raw.github.com/Enome/linode-deployment/master/ssh.sh | sh

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

# Varnish ( reserved proxy )
curl https://raw.github.com/Enome/linode-deployment/master/varnish.sh | sh

# Coffee-script
npm install -g coffee-script

# Elasticsearch
curl https://raw.github.com/Enome/linode-deployment/master/elasticsearch.sh | sh

# Graphicsmagick
curl https://raw.github.com/Enome/linode-deployment/master/graphicsmagick.sh | sh

# Firewall
