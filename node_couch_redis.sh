# Install curl
apt-get install -y curl

# Root ssh keys
curl https://raw.github.com/Enome/linode-deployment/master/ssh.sh

# Update apt-get
curl https://raw.github.com/Enome/linode-deployment/master/apt-get.sh

# Dependencies
curl https://raw.github.com/Enome/linode-deployment/master/dependencies.sh

# Git
curl https://raw.github.com/Enome/linode-deployment/master/git.sh

# Node.js
curl https://raw.github.com/Enome/linode-deployment/master/node.sh
