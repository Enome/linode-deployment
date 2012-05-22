cd ~
sudo apt-get install unzip
sudo apt-get install python-software-properties -y
sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
sudo apt-get update
sudo apt-get install sun-java6-jre sun-java6-plugin -y

wget https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-0.19.4.tar.gz -O elasticsearch.tar.gz

tar -xf elasticsearch.tar.gz
rm elasticsearch.tar.gz
sudo mv elasticsearch-* elasticsearch
sudo mv elasticsearch /usr/local/share

cat > /etc/init/elasticsearch.conf <<EOF
# ElasticSearch Service

description     "ElasticSearch"

start on (net-device-up
          and local-filesystems
          and runlevel [2345])

stop on runlevel [016]

respawn limit 10 5

env ES_HOME=/usr/local/share/elasticsearch
env ES_MIN_MEM=256m
env ES_MAX_MEM=2g

console output

script
  /usr/local/share/elasticsearch/bin/elasticsearch -f
end script
EOF

start elasticsearch
