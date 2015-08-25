echo "127.0.0.1  localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" > /etc/hosts

for hostEntry in "$@"
do
  echo -e $hostEntry >> /etc/hosts
done
