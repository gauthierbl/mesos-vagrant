# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_LEVEL = 2

PROVISION_SCRIPTS_BASE_DIR = "./provision/sh"

MESOS_NODE_CONFIG = [
  {
    :hostname => "mesos-master",
    :ip_address => "10.10.10.10",
    :master => true
  },
  {
    :hostname => "mesos-node-01",
    :ip_address => "10.10.10.11"
  },
  {
    :hostname => "mesos-node-02",
    :ip_address => "10.10.10.12"
  },
  {
    :hostname => "mesos-node-03",
    :ip_address => "10.10.10.13"
  },
  {
    :hostname => "mesos-node-04",
    :ip_address => "10.10.10.14"
  }
]

Vagrant.configure(VAGRANT_API_LEVEL) do |config|

  MESOS_NODE_CONFIG.each do |node_config|
    config.vm.define node_config[:hostname] do |node|
      node.vm.box = "chef/centos-7.0"

      # Network settings
      node.vm.network "private_network", ip: node_config[:ip_address]
      node.vm.hostname = node_config[:hostname]

      node.vm.provision "shell" do |s|
        s.name = "update hosts file"
        s.args = MESOS_NODE_CONFIG.map{ |nc| "#{nc[:ip_address]} #{nc[:hostname]}" }
        s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/updateHostFile.sh"
      end

      node.vm.provision "shell" do |s|
        s.name = "provision base"
        s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosBase.sh"
      end

      if node_config[:master]

        # provision as mesos-master
        node.vm.provision "shell" do |s|
          s.name = "provision master"
          s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosMaster.sh"
        end

      else

      # provision as mesos-slave
        node.vm.provision "shell" do |s|
          s.name = "provision slave"
          s.args = "#{MESOS_NODE_CONFIG[0][:ip_address]}"         # TODO: Hacky....
          s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosSlave.sh"
        end
      end

    end
  end
end
