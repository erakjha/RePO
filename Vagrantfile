# -*- mode: ruby -*-
# vi: set ft=ruby :
file_to_disk = './tmp/large_disk.vdi'
Vagrant.configure("2") do |config|

config.vm.network "forwarded_port", guest: 22, host: 2222
N = 1
(1..N).each do |machine_id|
  config.vm.define "machine#{machine_id}" do |machine|
    machine.vm.box = "geerlingguy/centos8"
    machine.vm.hostname = "machine#{machine_id}"
    machine.vm.network "private_network", ip: "192.168.77.#{20+machine_id}"
    machine.vm.provider "virtualbox" do |v|
    v.name = "machine#{machine_id}"
    v.memory = 1536
    v.cpus = 2
    end
    config.ssh.insert_key = false

  end
end

end
