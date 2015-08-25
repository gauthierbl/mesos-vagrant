# config mesos-slave zookeeper file
echo "zk://$1:2181/mesos" > /etc/mesos/zk


# Start service
service mesos-slave start
