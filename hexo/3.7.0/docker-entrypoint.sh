#!/bin/sh
if [ -e /github.com/hexo ]; then
    cd /github.com/hexo
    if [ ! -e /github.com/hexo/node_modules ]; then
        npm install
    fi
    hexo clean
    hexo server
else
    echo 'docker run --name hexo-server -p 4000:4000 -v $HOME/.ssh:/root/.ssh -v /github.com/hexo:/github.com/hexo -it yuweijun/hexo-server:3.7.0'
fi
