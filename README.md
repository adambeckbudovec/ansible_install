# AnsibleAutomation
![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)
###

*This is the configuration ofthe fisrt ansible node, which is going to become the Master Node and used to propogate accross the network.*

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
`USER_NAME@remote`
Checking to make sure that your new account works and has ssh priveleges
```
cat << EOF >/etc/sudoers.d/USER_NAME $USER_NAME ALL = (root) NOPASSWD:ALL EOF    chmod 0440 /etc/sudoers.d/USER_NAME
```
This configuration will perform least privelege with this account and allow for the user to no longer need to use password to access via SSH
###

