cat > /etc/init/express-services.conf << EOF
#!upstart

description "express-services"
author      "Geert"

start on (local-filesystems and net-device-up IFACE=eth0) 
stop  on shutdown

#respawn                # restart when job dies

instance \$service

script
  export NODE_ENV="production"
  exec /usr/bin/coffee /root/apps/krafters/\$service.coffee >> /root/logs/krafters/\$service.log 2>&1
end script
EOF
