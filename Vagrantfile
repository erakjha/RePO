# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk = './tmp/large_disk.vdi'




Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "centos/7"
    jenkins.vm.network "private_network", ip: "192.168.77.20"
    jenkins.vm.provider "virtualbox" do |v|
        v.name = "jenkins"
        v.memory = 1536
        v.cpus = 2
     end
   end

  
end
