# Install Marathon and Chronos
yum -y install marathon chronos

# Install ZooKeeper
rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
yum -y install zookeeper zookeeper-server
sudo -u zookeeper zookeeper-server-initialize --myid=1

# Set the cluster name
echo 'vagrant-cluster' > /etc/mesos-master/cluster

# Don't run mesos-slave on boot
sudo systemctl stop mesos-slave.service
sudo systemctl disable mesos-slave.service

# Start Zookeeper
service zookeeper-server start

# Start mesos-master
service mesos-master start

# Start Marathon
service marathon start

#Start Chronos
service chronos start

# Setup HAProxy
wget https://raw.githubusercontent.com/mesosphere/marathon/master/bin/haproxy-marathon-bridge
chmod 755 haproxy-marathon-bridge
./haproxy-marathon-bridge install_haproxy_system localhost:8080
service haproxy start
