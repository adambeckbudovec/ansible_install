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
   sudo apt-get install aptitude -y
 
##Change the username and remote address, otherwise is will use the current user and use str remote for addressing
cat ~/.ssh/id_rsa.pub | ssh user@remote "mkdir /home/user/somedir/.ssh; \
cat >> /home/user/somedir/.ssh/authorized_keys; touch hello; mkdir /test/morning; \
cp hello /test/morning"   

   ##echo "Installing ansible"
   ##sudo apt install ansible -y
   ##echo "ansible is installed"
   
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
   echo "FreeBSD"
fi
