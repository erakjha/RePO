#!/bin/bash
set -ex
hostnamectl set-hostname agent01.example.com
sudo systemctl stop firewalld
sudo systemctl disable firewalld
echo -e "192.168.77.21 agent01.example.com\n192.168.77.20 puppetselfcontained.example.com" >> /etc/hosts
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
yum install puppet-agent -y
echo -e "certname = agent01.example.com\nserver = puppetselfcontained.example.com" >> /etc/puppetlabs/puppet/puppet.conf
sudo systemctl restart puppet
