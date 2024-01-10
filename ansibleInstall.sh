#!/bin/shell
cd ~
echo $HOME
echo $whoami
##Ensure that the user has the privileges to install programs and if this is the same user specific to ansible

echo "Checking Operating System"

platform='unknown'

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' || 'ubuntu' ]]; then
   platform='linux'
   echo "LINUX"
   sudo apt-get update && sudo apt-get upgrade -y
   echo "System is up to date"
   echo "Installing Python3"
   sudo apt-get install python3 -y
   echo "Installing ansible repositories"
   sudo apt install software-properties-common -y 
   sudo add-apt-repository --yes --update ppa:ansible/ansible -y
   echo "Installing aptitude for ansible"
   sudo apt-get install aptitude -y
   echo "Installing ansible"
   sudo apt install ansible -y
   echo "ansible is installed"
   echo "Remaining actions can be completed through yaml"
   
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
   echo "FreeBSD"
fi
