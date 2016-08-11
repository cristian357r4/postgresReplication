# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "m1" do |m1|
    
    m1.vm.box = "ubuntu/xenial64"
    m1.vm.network "private_network", ip: "172.28.128.3"
    m1.vm.network :forwarded_port, host: 5555, guest: 5432
    m1.vm.hostname = "m1"
    m1.vm.provision :shell, path: "createDB.sh"
    m1.vm.provision :shell, path: "provisionM1.sh"
    m1.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

  end  

  config.vm.define "m2" do |m2|
    
    m2.vm.box = "ubuntu/xenial64"
    m2.vm.network "private_network", ip: "172.28.128.4"
    m2.vm.network :forwarded_port, host: 5556, guest: 5432
    m2.vm.hostname ="m2"
    m2.vm.provision :shell, path: "createDB.sh"
    m2.vm.provision :shell, path: "provisionM2.sh"
    m2.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end  
  
end
