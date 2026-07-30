#!/usr/bin/env bash

set -euo pipefail

echo "[Info] Fixing CentOS repositories to point to CentOS Vault..."
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

echo "[Info] Cleaning yum cache..."
yum clean all

echo "[Info] Installing EPEL repository..."
yum install -y epel-release

echo "[Info] Installing Ansible..."
yum install -y ansible

echo "[Info] Running the Ansible Playbook..."
ansible-playbook /vagrant/playbook.yml --connection=local