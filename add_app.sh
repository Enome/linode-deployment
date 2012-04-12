#!/bin/sh 
 
echo -n "Application name:" 
read name 
 
# Bare repository 
 
repo="/root/repositories/$name" 
echo $repo 
mkdir -p $repo 
cd $repo 
git init --bare 
 
# Application Dir 
 
app="/root/applications/$name" 
mkdir -p $app 
 
# Add post-receive 

pr=$repo/hooks/post-receive 
echo "git --work-tree=\"$app\" checkout -f" > $pr
echo "cd $app" >> $pr
echo "make reload" >> $pr
chmod +x $pr

# Logs

mkdir -p /root/logs/$name

# Add upstart
cat > /etc/init/$name.conf << EOF
#!upstart

description "Express Application"
author      "Geert"

start on (local-filesystems and net-device-up IFACE=eth0)
stop  on shutdown

respawn

script
  export NODE_ENV="production"
  exec /usr/bin/coffee /root/applications/$name/website.coffee >> /root/logs/$name/website.coffee 2>&1
end script
EOF
