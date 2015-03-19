apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update -q
apt-get install -qy lxc-docker 

docker pull rabbitmq
docker pull redis
#docker pull tobert/cassandra

docker run --restart=always -d -p 172.19.0.2:5672:5672 -p 172.19.0.2:15672:15672 rabbitmq:3-management
docker run --restart=always -d -p 172.19.0.3:6379:6379 redis

#mkdir /srv/cassandra1
#mkdir /srv/cassandra2
#$ID=$(docker run --restart=always -d -v /srv/cassandra1:/data -p 172.19.0.4:7000 -p 172.19.0.4:9160 tobert/cassandra)
#$IP$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' $ID)
#docker run --restart=always -d -v /srv/cassandra2:/data -p 172.19.0.5:7000 -p 172.19.0.5:9160 tobert/cassandra -seeds $IP

