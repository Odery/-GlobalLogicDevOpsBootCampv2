#!/bin/bash

# update package source
apt-get -y update

# install NGINX
apt-get -y install nginx

# change default site a little
cat > /var/www/html/index.nginx-debian.html << EOL 
<!DOCTYPE html><html><head><title>Welcome to nginx!</title><style>
body {width: 35em;margin: 0 auto;font-family: Tahoma, Verdana, Arial, sans-serif;}
</style></head><body><h1>Stepan Romanchuk HW2</h1><p>GL Home Work No.2.</p>
EOL