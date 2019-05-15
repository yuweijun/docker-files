FROM yuweijun/hexo

RUN apt update && apt install -y rsync
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4000
CMD ["/bin/bash"]