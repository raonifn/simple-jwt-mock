#!/bin/bash

sudo apt install git

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

git clone https://github.com/raonifn/simple-jwt-mock.git

cd simple-jwt-mock

nvm use

npm i

nohup (npm start &)
