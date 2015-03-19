COOKIE=iminurerlangz
RABBIT_ENV="-e \"ERLANG_COOKIE=$COOKIE\""

echo "172.19.0.2 rabbit-1" >> /etc/hosts
echo "172.19.0.3 rabbit-2" >> /etc/hosts

RABBIT1=$(docker run -d -p 172.19.0.2:5672:5672 -p 172.19.0.2:15672:15672 -p 172.19.0.2:25672:25672 -p 172.19.0.2:4369:4369 $RABBIT_ENV -h rabbit-1 rabbitmq:3-management)
RABBIT2=$(docker run -d -p 172.19.0.3:5672:5672 -p 172.19.0.3:15672:15672 -p 172.19.0.3:25672:25672 -p 172.19.0.3:4369:4369 $RABBIT_ENV -h rabbit-2 rabbitmq:3-management)

docker exec -t $RABBIT1 su -c "rabbitmqctl stop_app"
docker exec -t $RABBIT1 su -c "echo $COOKIE > /var/lib/rabbitmq/.erlang.cookie"
docker exec -t $RABBIT1 su -c "rabbitmqctl start_app"
docker exec -t $RABBIT1 su -c "echo 172.19.0.3 rabbit-2 >> /etc/hosts"

docker exec -t $RABBIT2 su -c "rabbitmqctl stop_app"
docker exec -t $RABBIT2 su -c "echo $COOKIE > /var/lib/rabbitmq/.erlang.cookie"
docker exec -t $RABBIT2 su -c "rabbitmqctl start_app"
docker exec -t $RABBIT2 su -c "echo 172.19.0.2 rabbit-1 >> /etc/hosts"
