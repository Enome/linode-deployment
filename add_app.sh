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
touch $pr
chmod +x $pr

cat > $pr << EOF 
#checkout working tree 
git --work-tree="$app" checkout -f 
EOF 
