#!/usr/bin/env bash
sudo hostnamectl set-hostname jenkins.example.com
sudo yum install docker -y
echo -e "192.168.77.20 jenkins.example.com" >> /etc/hosts
sudo systemctl enable docker
sudo systemctl start docker
sudo docker pull jenkins/jenkins:lts
sudo docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

