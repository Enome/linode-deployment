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
chmod +x $pr

# Logs

mkdir -p /root/logs/$name
