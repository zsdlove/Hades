FROM ubuntu:16.04
WORKDIR /usr/src/app 
COPY . . 
EXPOSE 8088
COPY redis.conf /usr/local/etc/redis/redis.conf
COPY sources.list /etc/apt/sources.list
CMD ["bash","build.sh"]

