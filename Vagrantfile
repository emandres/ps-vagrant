# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "./bootstrap.sh"
  config.vm.network "forwarded_port", guest: 5672, host:5672
  config.vm.network "forwarded_port", guest: 15672, host:15672
  config.vm.network "forwarded_port", guest: 6379, host:6379

  config.vm.network "forwarded_port", guest: 7000, host:7000
  config.vm.network "forwarded_port", guest: 7001, host:7001
  config.vm.network "forwarded_port", guest: 7199, host:7199
  config.vm.network "forwarded_port", guest: 9042, host:9042
  config.vm.network "forwarded_port", guest: 9160, host:9160

  config.vm.network "public_network", ip: "172.19.0.1"
  config.vm.network "public_network", ip: "172.19.0.2", adapter: 2
  config.vm.network "public_network", ip: "173.19.0.3", adapter: 3

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
end
