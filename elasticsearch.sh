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

curl -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz
mv *servicewrapper*/service /usr/local/share/elasticsearch/bin/
rm -Rf *servicewrapper*
sudo /usr/local/share/elasticsearch/bin/service/elasticsearch install
sudo ln -s `readlink -f /usr/local/share/elasticsearch/bin/service/elasticsearch` /usr/local/bin/rcelasticsearch
