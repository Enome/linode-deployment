# root ssh keys
mkdir /root/.ssh
echo $SSH_KEY >> /root/.ssh/authorized_keys
chmod 0700 /root/.ssh
