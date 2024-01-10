# Ansible Installation via bash
![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)
###

*This is the configuration ofthe first ansible node, which is going to become the Master Node and used to propogate accross the network.*

###
## Prerequisistes 
> Must have sudo priveleges
> Must have access to main ansible Node/Master Node
> It is important that the user is using the username for the SSH they wil be using for the ansible deployment

## Setup
1. Setup user account for ansible
2. Create Password unique to the ansible user account
###
> [!Important]
> Make sure to change the <code style="color: red">***USER_NAME***</code> to the desired username.
> Make sure to change the <code style="color: red">***USER_NAME***</code> to the desired.
> This username and password is recommended to be unique to the ansible user.
###
> [!Warning]
> Having the default user/root account as the ansible account with the same password is not recommended and can lead to security issues.
> Do not leave root as the main usage account
> Try not to re-use passwords
###
```ruby
ssh-keygen -t rsa USER_NAME
ssh-copy-id -i my_id.pub root@remote
```
This will create an SSH key for the server that you will be connecting to, next you will need to make an account to execute Least Privelege
###
```ruby
adduser USER_NAME
passwd USER_NAME
usermod -aG sudo USER_NAME
```
###
If there is a firewall make sure to add ssh into the rules
  - If using ufw
    ```ruby
    ufw allow ssh
    ufw enable
    ufw status
    ```
Test the connection using ssh
`USER_NAME@remote_ip_address`
Checking to make sure that your new account works and has ssh priveleges
```ruby
cat << EOF >/etc/sudoers.d/USER_NAME $USER_NAME ALL = (root) NOPASSWD:ALL EOF    chmod 0440 /etc/sudoers.d/USER_NAME
```
This configuration will perform least privelege with this account and allow for the user to no longer need to use password to access via SSH
###
And now you can begin the ansible installion section using the following link
Be sure to have wget, git clone or something
````ruby
wget https://github.com/adambeckbudovec/ansible_config/blob/5cee20ec0f5e0524c9fd8063672d7d09fdede845/ansibleInstall.sh
git clone https://github.com/adambeckbudovec/ansible_config/blob/5cee20ec0f5e0524c9fd8063672d7d09fdede845/ansibleInstall.sh

bash ansibleInstall.sh
````
# YAML configuration and Confgiuration of Automated Initial server
![](https://media1.giphy.com/media/13CoXDiaCcCoyk/giphy.gif?cid=ecf05e47v1guwyces2xoma74yy8d4fhn74ej0mfpq59zwpee&ep=v1_gifs_search&rid=giphy.gif&ct=g)
###
Go into /etc/ansible/hosts
`cd /etc/ansible`
`nano hosts`
Change the list to reflect what you want to be done
> Here is an example of how the hosts file should look
```ruby
ungrouped:
  hosts:
    mail.example.com:
routers:
  hosts:
    router1.domain.com
webservers:
  hosts:
    foo.example.com:
    bar.example.com:
dbservers:
  hosts:
    one.example.com:
    two.example.com:
    three.example.com:
east:
  hosts:
    foo.example.com:
    one.example.com:
    two.example.com:
west:
  hosts:
    bar.example.com:
    three.example.com:
prod:
  hosts:
    foo.example.com:
    one.example.com:
    two.example.com:
test:
  hosts:
    bar.example.com:
    three.example.com:
```
# Next is the playbook
###
Accessing **playnook.yml**
`nano playbook.yml`
