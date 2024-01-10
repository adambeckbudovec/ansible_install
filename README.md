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
> Make sure to change the USER_NAME to the desired username.
> Make sure to change the USER_NAME to the desired.
> This username and password is recommended to be unique to the ansible user.
###
> [!Warning]
> Having the default user/root account as the ansible account with the same password is not recommended and can lead to security issues.
###
```ruby
require 'redcarpet'
adduser USER_NAME
passwd USER_NAME
cat << EOF >/etc/sudoers.d/USER_NAME <mark>$USER_NAME</mark> ALL = (root) NOPASSWD:ALL EOF
chmod 0440 /etc/sudoers.d/<mark>USER_NAME</mark>
```
###
```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
