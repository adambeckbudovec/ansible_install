# AnsibleAutomation
![Alt Text](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)
###

*This is the configuration ofthe fisrt ansible node, which is going to become the Master Node and used to propogate accross the network.*

###
## Prerequisistes 
>It is important that the user is aware the username for the SSH they wil be using for the ansible deployment

## Setup
1. Setup user account for ansible
2. Create Password unique to the ansible user account
###
> [!Important]
> Make sure to change the USER_NAME to the desired username
> Make sure to change the USER_NAME to the desired
###
```
adduser USER_NAME

passwd USER_NAME

cat << EOF >/etc/sudoers.d/USER_NAME
$USER_NAME ALL = (root) NOPASSWD:ALL
EOF
```
