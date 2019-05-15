添加docker用户并设置目录权限

useradd -u 999 -U docker
# or
# useradd -u 999 -g docker docker
mdkir -p /data/mysql
chown -R docker:docker /data/mysql