#!/bin/bash

sudo apt install -y git nginx

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

git clone https://github.com/raonifn/simple-jwt-mock.git

cd simple-jwt-mock

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install

npm i

cat | sudo tee /etc/nginx/conf.d/proxy.conf <<END
server {
  listen 80;
  listen [::]:80;

  location /rest/V1/ {
      proxy_pass https://industrious.swisssense.nl;
  }
}
END
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -s reload

(nohup npm start) > /dev/null 2>&1 &
