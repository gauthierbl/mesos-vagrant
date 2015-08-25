

# Get Mesos
rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm

# Install Docker and Mesos
yum -y install device-mapper-event-libs docker mesos

# Start Docker
service docker start

# Allow vagrant user to do docker stuff
# sudo usermod -aG docker vagrant
