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
  # {
  #   :hostname => "mesos-node-03",
  #   :ip_address => "10.10.10.13"
  # },
  # {
  #   :hostname => "mesos-node-04",
  #   :ip_address => "10.10.10.14"
  # }
]

Vagrant.configure(VAGRANT_API_LEVEL) do |config|

  MESOS_NODE_CONFIG.each do |node_config|
    config.vm.define node_config[:hostname] do |node|
      node.vm.box = "chef/centos-7.0"

      # config.vm.provider "virtualbox" do |v|
      #   v.memory = 2048
      #   v.cpus = 2
      # end

      # Network settings
      node.vm.network "private_network", ip: node_config[:ip_address]
      node.vm.hostname = node_config[:hostname]

      #TODO: the host are hard coded in the shell script for now :-(
      node.vm.provision "shell" do |s|
        s.name = "update hosts file"
        s.args = MESOS_NODE_CONFIG.map{ |nc| "#{nc[:ip_address]} #{nc[:hostname]}" }
        s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/01_updateHostFile.sh"
      end

      node.vm.provision "shell" do |s|
        s.name = "provision base"
        s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosBase.sh"
      end

      if node_config[:master]

        node.vm.provision "shell" do |s|
          s.name = "provision master"
          s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosMaster.sh"
        end

      else

        node.vm.provision "shell" do |s|
          s.name = "provision slave"
          s.args = "#{MESOS_NODE_CONFIG[0][:ip_address]}"         # TODO: Hacky....
          s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/mesosSlave.sh"
        end
      end



      # node.vm.provision "shell" do |s|
      #   s.name = "install Mesos and Marathon"
      #   s.args = "#{node_config[:ip_address]} #{node_config[:hostname]}"
      #   s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/02_installMesos.sh"
      # end
      #
      # node.vm.provision "shell" do |s|
      #   s.name = "install ZooKeeper"
      #   s.args = "#{node_config[:ip_address]} #{node_config[:hostname]}"
      #   s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/03_installZooKeeper.sh"
      # end
      #
      # node.vm.provision "shell" do |s|
      #   s.name = "start mesos-master and mesos-slave"
      #   s.args = "#{node_config[:ip_address]} #{node_config[:hostname]}"
      #   s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/04_startMesos.sh"
      # end
      #
      # node.vm.provision "shell" do |s|
      #   s.name = "start marathon"
      #   s.args = "#{node_config[:ip_address]} #{node_config[:hostname]}"
      #   s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/05_startMarathon.sh"
      # end
      #
      # node.vm.provision "shell" do |s|
      #   s.name = "install and start Chronos"
      #   s.args = "#{node_config[:ip_address]} #{node_config[:hostname]}"
      #   s.path = "#{PROVISION_SCRIPTS_BASE_DIR}/06_installChronos.sh"
      # end

    end
  end



end
