apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update -q
apt-get install -qy lxc-docker 

docker pull rabbitmq
docker pull redis
docker pull tobert/cassandra

docker run --restart=always -d -p 172.19.0.2:5672:5672 -p 172.19.0.2:15672:15672 rabbitmq:3-management
docker run --restart=always -d -p 172.19.0.3:6379:6379 redis

mkdir /srv/cassandra
docker run --restart=always -d -v /srv/cassandra:/data -p 172.19.0.4:7000:7000 -p 172.19.0.4:9160:9160 -p 172.19.0.4:9042:9042 tobert/cassandra
sed --in-place=.old s/^(\s+listen_address:\s+)\d+\.\d+\.\d+\.\d+(.*)$/\1127.0.0.1\2/ /srv/cassandra/conf/cassandra.yaml
sed --in-place=.old2 s/^(\s+seeds:\s+)\d+\.\d+\.\d+\.\d+(.*)$/\1127.0.0.1\2/ /srv/cassandra/conf/cassandra.yaml
sed --in-place=.old s/3941/512/ /srv/cassandsa/conf/sproks/cassandra.yaml
sed --in-place=.old s/800/256/ /srv/cassandsa/conf/sproks/cassandra.yaml
docker run --restart=always -d -v /srv/cassandra:/data -p 172.19.0.4:7000:7000 -p 172.19.0.4:9160:9160 -p 172.19.0.4:9042:9042 tobert/cassandra
