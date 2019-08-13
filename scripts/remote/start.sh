#!/bin/bash

sudo apt install -y git

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

git clone https://github.com/raonifn/simple-jwt-mock.git

cd simple-jwt-mock

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install

npm i

(nohup npm start) > /dev/null 2>&1 &
