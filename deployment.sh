#!/bin/sh

echo -n 'Name of application:'
read app

# Bare repository

mkdir /root/repository
mkdir /root/repository/${app}
cd /root/repository/${app}
git init --bare

# Add post-receive

cd hooks
curl https://raw.github.com/Enome/linode-deployment/master/express-post-receive > post-receive
chmod +x post-receive
