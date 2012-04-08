app="first"

# Bare respo

mkdir /root/repository
mkdir /root/repository/${app}
git init /root/repository/${app} --bare

# Add post-receive

curl https://raw.github.com/Enome/linode-deployment/master/express-post-receive > /root/repository/app/hooks/post-receive
chmod +x /root/repository/app/hooks/post-receive
