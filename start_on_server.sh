#!/bin/bash

shopt -s lastpipe

node -v | cut -d 'v' -f 2 | cut -d '.' -f 1 | read node_version

if [ $node_version -ge 17 ]
then
    export NODE_OPTIONS=--openssl-legacy-provider
fi

mv .git ./web

cd ./web

npm install

npm run build

npm run start

mv .git ../

cd ../