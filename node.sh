# install node
apt-get install -y python-software-properties
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# install npm
curl http://npmjs.org/install.sh | clean=no sh
