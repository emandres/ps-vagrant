apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update -q
apt-get install -qy lxc-docker 

docker pull rabbitmq
docker pull redis
docker pull tobert/cassandra

docker run --restart=always -d -p 5672:5672 -p 15672:15672 rabbitmq:3-management
docker run --restart=always -d -p 6379:6379 redis

docker run --restart=always -d -v /srv/cassandra:/data -p 7000:7000 -p 9160:9160 tobert/cassandra
