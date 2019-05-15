## cd redis/4.0 directory and run commands

    docker pull redis
    docker container rm localhost-redis
    docker run -p 6379:6379 -v $PWD/conf:/usr/local/etc/redis --name localhost-redis redis redis-server /usr/local/etc/redis/redis.conf

