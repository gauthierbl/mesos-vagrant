

# TODO:
- [ ] Add sample Docker json for marathon
- [ ] Get [service discovery](https://open.mesosphere.com/getting-started/service-discovery/) working with HAProxy
- [ ] Fix hacky mesos-slave ip address assignment
- [ ] Convert MESOS_NODE_CONFIG to a yaml file that can be read in
  - [ ] Have a production like (HA etc) config
  - [ ] Have a dev mode config with slave and master running on same single vm
- [ ] Convert shell scripts to [Chef Solo](http://docs.chef.io/chef_solo.html) using the [Chef Solo Provisioner](http://docs.vagrantup.com/v2/provisioning/chef_solo.html)
- [ ] change VM box to a centos-7-minimal install or maybe ubuntu?
