# config mesos-slave zookeeper file
echo "zk://$1:2181/mesos" > /etc/mesos/zk

# We want to use Docker:
echo 'docker,mesos' > /etc/mesos-slave/containerizers

# The executor timeout needs to be longeer to account for the potential delay in pulling a docker image
echo '5mins' > /etc/mesos-slave/executor_registration_timeout

# Don't run mesos-master on boot
sudo systemctl stop mesos-master.service
sudo systemctl disable mesos-master.service

# Start service
service mesos-slave start
