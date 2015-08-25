# Install Marathon and Chronos
yum -y install marathon chronos

# Install ZooKeeper
rpm -Uvh http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm
yum -y install zookeeper zookeeper-server
sudo -u zookeeper zookeeper-server-initialize --myid=1

# Start Zookeeper
service zookeeper-server start

# Start mesos-master
service mesos-master start

# Start Marathon
service marathon start

#Start Chronos
service chronos start
