#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Detect the operating system
if [ -f /etc/os-release ]; then
    source /etc/os-release
    os=$ID
else
    echo "Unsupported operating system. Please install Ansible manually."
    exit 1
fi

# Install Ansible based on the operating system
case $os in
    "ubuntu" | "debian")
        apt update
        apt install -y software-properties-common
        apt-add-repository --yes --update ppa:ansible/ansible
        apt install -y ansible
        ;;
    "centos" | "rhel" | "fedora")
        yum install -y epel-release
        yum install -y ansible
        ;;
    *)
        echo "Unsupported operating system. Please install Ansible manually."
        exit 1
        ;;
esac

# Check if Ansible installation was successful
if command -v ansible &> /dev/null; then
    echo "Ansible has been successfully installed."
else
    echo "Failed to install Ansible. Please check for errors."
    exit 1
fi
