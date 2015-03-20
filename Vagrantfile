# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "./bootstrap.sh"

  config.vm.network "private_network", ip: "172.19.0.2", adapter: 2 # rabbit
  config.vm.network "private_network", ip: "172.19.0.3", adapter: 3 # redis
  config.vm.network "private_network", ip: "172.19.0.4", adapter: 4 # cassandra 1
  #config.vm.network "private_network", ip: "172.19.0.5", adapter: 5 # cassandra 2

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
end
