## Install CouchDB dependecies then build CouchDB

function build_couchdb {
  # $1 - path to couchdb source
  # $2 - installation tree prefix
  apt-get -y install libmozjs-dev libicu-dev libcurl4-gnutls-dev libtool erlang-dev erlang

  couch_prefix=$2

  cd $1
  ./configure --prefix=${couch_prefix}
  make && make install
  cd -

  # Add couchdb user account
  useradd -d ${couch_prefix}/var/lib/couchdb couchdb

  # Change file ownership from root to couchdb user and adjust permissions
  chown -R couchdb: ${couch_prefix}/var/lib/couchdb \
    ${couch_prefix}/var/log/couchdb \
    ${couch_prefix}/var/run/couchdb \
    ${couch_prefix}/etc/couchdb
  chmod 0770 ${couch_prefix}/var/lib/couchdb/ \
    ${couch_prefix}/var/log/couchdb/ \
    ${couch_prefix}/var/run/couchdb/
  chmod 664 ${couch_prefix}/etc/couchdb/*.ini
  chmod 775 ${couch_prefix}/etc/couchdb/*.d

  if [ -n "$couch_prefix" -a "$couch_prefix" != "/" ]
  then
    # Configure logrotate
    ln -s ${couch_prefix}/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
    # Configure the init script
    ln -sf ${couch_prefix}/etc/init.d/couchdb /etc/init.d/couchdb
  fi

  # Start couchdb
  service couchdb start
  # Start couchdb on system start
  update-rc.d couchdb defaults

  # Verify couchdb is running
  sleep 2 # must wait a little...
  curl http://127.0.0.1:5984/
  # {"couchdb":"Welcome","version":"1.1.1"}
}

apt-get -y install curl build-essential

COUCH_VERSION="1.1.1"
COUCH_BIND_ADDRESS="0.0.0.0"
COUCH_PORT="5984"
COUCH_HOST="http://$COUCH_BIND_ADDRESS:$COUCH_PORT"
COUCH_PREFIX="/usr/local"

cd /opt
curl http://apache.cu.be/couchdb/${COUCH_VERSION}/apache-couchdb-${COUCH_VERSION}.tar.gz | tar zxv
cd -
 
build_couchdb "/opt/apache-couchdb-${COUCH_VERSION}" "$COUCH_PREFIX"
