# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk = './tmp/large_disk.vdi'




Vagrant.configure("2") do |config|
  config.vm.define "machine1" do |machine1|
    machine1.vm.box = "centos/7"
    machine1.vm.network "private_network", ip: "192.168.77.20"
    machine1.vm.provider "virtualbox" do |v|
        v.name = "machine1"
        v.memory = 4096
        v.cpus = 3
     end
  machine1.vm.provision "shell", path: "script.sh"
  end

  config.vm.define "machine2" do |machine2|
    machine2.vm.box = "centos/7"
    machine2.vm.network "private_network", ip: "192.168.77.21"
    machine2.vm.provider "virtualbox" do |v|
        v.name = "machine2"
        v.memory = 1024
        v.cpus = 1
     end
  machine2.vm.provision "shell", path: "script2.sh"
  end

end
