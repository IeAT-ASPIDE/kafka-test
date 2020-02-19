# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.network "private_network", ip: "192.168.50.5"
  config.vm.network "forwarded_port", guest: 9092, host: 9092
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", path: "provisioning.sh"

end