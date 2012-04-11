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
 
cat > $repo/hooks/post-receive << EOF 
#checkout working tree 
git --work-tree="$app" checkout -f 
EOF 
 
chmod +x $repo/hooks/post-receive 
