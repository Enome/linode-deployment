REDIS_VERSION="2.4.10"
REDIS_NAME=redis-$REDIS_VERSION
REDIS_URL="http://redis.googlecode.com/files/${REDIS_NAME}.tar.gz"

# Download
cd /opt
curl $REDIS_URL | tar xvz

# Configure
cd /opt/$REDIS_NAME
make
make install

# Download config
mkdir -p /etc/redis
curl https://raw.github.com/gist/1164482/77e4ecf14ffac42b0e987e7ffe16cb757d734ff9/redis.conf > /etc/redis/redis.conf

# Download startup script
curl https://raw.github.com/gist/1164503/d1bc2cc6782b943d9b28aa93fc7038f4ae5a905f/redis-server > /etc/init.d/redis-server
chmod +x /etc/init.d/redis-server

# Setup User
useradd redis
mkdir -p /var/lib/redis
mkdir -p /var/log/redis
chown redis.redis /var/lib/redis
chown redis.redis /var/log/redis

# Add to start up
update-rc.d redis-server defaults

# Start redis
/etc/init.d/redis-server start
