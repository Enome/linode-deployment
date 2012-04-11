## Install CouchDB dependecies then build CouchDB

apt-get -y install curl build-essential
apt-get -y install libmozjs-dev libicu-dev libcurl4-gnutls-dev libtool erlang-dev erlang

COUCH_VERSION="1.2.0"
COUCH_BIND_ADDRESS="0.0.0.0"
COUCH_PORT="5984"
COUCH_HOST="http://$COUCH_BIND_ADDRESS:$COUCH_PORT"
COUCH_PREFIX="/usr/local"

# Download
cd /opt
curl http://apache.cu.be/couchdb/releases/${COUCH_VERSION}/apache-couchdb-${COUCH_VERSION}.tar.gz | tar zxv
cd -

# Configure
cd "/opt/apache-couchdb-${COUCH_VERSION}"
./configure --prefix=${COUCH_PREFIX}
make && make install
cd -

# Add couchdb user account
useradd -d ${COUCH_PREFIX}/var/lib/couchdb couchdb


# Change file ownership from root to couchdb user and adjust permissions
chown -R couchdb: ${COUCH_PREFIX}/var/lib/couchdb \
${COUCH_PREFIX}/var/log/couchdb \
${COUCH_PREFIX}/var/run/couchdb \
${COUCH_PREFIX}/etc/couchdb
chmod 0770 ${COUCH_PREFIX}/var/lib/couchdb/ \
${COUCH_PREFIX}/var/log/couchdb/ \
${COUCH_PREFIX}/var/run/couchdb/
chmod 664 ${COUCH_PREFIX}/etc/couchdb/*.ini
chmod 775 ${COUCH_PREFIX}/etc/couchdb/*.d

if [ -n "$COUCH_PREFIX" -a "$COUCH_PREFIX" != "/" ]
then
  # Configure logrotate
  ln -s ${COUCH_PREFIX}/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
  # Configure the init script
  ln -sf ${COUCH_PREFIX}/etc/init.d/couchdb /etc/init.d/couchdb
fi

# Start couchdb
service couchdb start
# Start couchdb on system start
update-rc.d couchdb defaults

# Verify couchdb is running
sleep 2 # must wait a little...
curl http://127.0.0.1:5984/
