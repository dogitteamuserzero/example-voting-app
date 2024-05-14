#!/bin/bash
sudo apt update
sudo apt install ca-certificates -y

# Ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
