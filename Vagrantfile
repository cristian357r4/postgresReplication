# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "m1" do |m1|
    #m1.vm.box = "http://localhost/swii/LMint17BaseBox.box"
    m1.vm.box = "tutmosisii/LMint64bits"
    m1.vm.network "private_network", type: "dhcp"
    m1.vm.hostname = "m1"
    m1.vm.provision :shell, path: "createDB.sh"
    m1.vm.provision :shell, path: "provisionM1.sh"
  end  

  config.vm.define "m2" do |m2|
    #m2.vm.box = "http://localhost/swii/LMint17BaseBox.box"
    m2.vm.box = "tutmosisii/LMint64bits"
    m2.vm.network "private_network", type: "dhcp"
    m2.vm.hostname ="m2"
    m2.vm.provision :shell, path: "createDB.sh"
    m2.vm.provision :shell, path: "provisionM2.sh"
  end  

  
  
end
