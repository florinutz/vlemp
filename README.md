# VLEMP
A vagrant machine with linux (ubuntu 14 04), nginx, mysql, php and node

First install vagrant, then the hostupdater plugin:

```bash
vagrant plugin install vagrant-hostsupdater
```

Configure Vagrantfile and puppet/modules/nginx/files/project.pro with your own host (and aliases?), ip and synchronized folder, then do 

```bash 
vagrant up.
```

You can find your synchronized folder in /vagrant inside the virtual machine.
