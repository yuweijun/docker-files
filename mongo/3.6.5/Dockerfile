FROM mongo

COPY $PWD/conf/mongod.conf /usr/local/etc/mongod.conf

EXPOSE 27017
CMD ["mongod", "--config", "/usr/local/etc/mongod.conf"]