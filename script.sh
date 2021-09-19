#!/usr/bin/env bash
set -ex
sudo hostnamectl set-hostname puppetselfcontained.example.com
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo -e "192.168.77.20 puppetselfcontained.example.com\n192.168.77.21 agent01.example.com" >> /etc/hosts
sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
sudo yum install puppetserver -y
echo "*.example.com" > /etc/puppetlabs/puppet/autosign.conf
echo -e "certname = puppetselfcontained.example.com\nserver = puppetselfcontained.example.com" >> /etc/puppetlabs/puppet/puppet.conf
sudo systemctl restart puppetserver
