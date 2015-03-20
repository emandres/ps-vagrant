apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update -q
apt-get install -qy lxc-docker 

docker pull rabbitmq
docker pull redis
docker pull tobert/cassandra

echo "Starting RabbitMQ on IP 172.19.0.2"
docker run --restart=always -d -p 172.19.0.2:5672:5672 -p 172.19.0.2:15672:15672 rabbitmq:3-management

echo "Starting Redis on IP 172.19.0.3"
docker run --restart=always -d -p 172.19.0.3:6379:6379 redis

echo "Starting Cassandra on IP 172.19.0.4"
mkdir /srv/cassandra
ID=$(docker run --restart=always -d -v /srv/cassandra:/data -p 172.19.0.4:7000:7000 -p 172.19.0.4:9160:9160 -p 172.19.0.4:9042:9042 tobert/cassandra)
sleep 5s
sed --i=.old -r 's/^(\s*listen_address:\s*).*$/\1127.0.0.1/' /srv/cassandra/conf/cassandra.yaml
sed --i -r 's/^(\s*-\s*seeds:\s*).*$/\1127.0.0.1/' /srv/cassandra/conf/cassandra.yaml
sed --i=.old -r 's/3941M/512M/' /srv/cassandra/conf/sproks/cassandra.yaml
sed --i -r 's/800M/256M/' /srv/cassandra/conf/sproks/cassandra.yaml
docker restart $ID
