# Windows Bootstrapping:

knife bootstrap windows winrm 52.201.225.210 --winrm-user Administrator --winrm-password 'HhrQCP&e*Ey' --node-name node1 --run-list 'recipe[learn_chef_iis]'


knife openstack server create -I 8e825674-c0e3-46c0-a101-929b55f3530a -f m1.small -N kumo-kuma01 --network-ids 7a7986b9-fe9a-45ee-a72c-76d26de259a1 --openstack-ssh-key-id scoday-win8 --ssh-user dcia --ssh-password dcia --sudo --no-host-key-verify -G default -r 'recipe[hello_chef_server]' --openstack-floating-ip -VVV

# Windows Image ID: 7e3c4e40-4cd7-4613-b1b2-e9d87afea961

knife openstack server create -I 7e3c4e40-4cd7-4613-b1b2-e9d87afea961 -f m1.medium -N kumo-win2k12 --network-ids 7a7986b9-fe9a-45ee-a72c-76d26de259a1 \
 -G default --winrm-user Administrator --winrm-password HP3DC1@2016 -r 'recipe[bootstrap.cmd'] --openstack-floating-ip -VVV



## From documentation 17052016:

Provisioning and bootstrapping for Windows 2003 and later images is now supported. The Windows images need to have WinRM enabled with Basic Authentication configured. Current support does not support Kerberos Authentication.

Example:

$ knife openstack server create -I <Image> -f <Flavor> -S <keypair_name> --bootstrap-protocol winrm -P <Administrator_Password> -x Administrator \
 -N <chef_node_name> --bootstrap-template windows-chef-client-msi.erb


 knife bootstrap windows winrm 16.147.35.216 --winrm-user Administrator --winrm-password 'HP3DC1@2016' --node-name kumo-win2k12 --run-list 'recipe[hello_chef_server'


 knife openstack server create -I 7e3c4e40-4cd7-4613-b1b2-e9d87afea961 -f m1.medium -N winbear003 --network-ids 7a7986b9-fe9a-45ee-a72c-76d26de259a1 \
  -G default windows winrm --winrm-user Administrator --winrm-password HP3DC1@2016 -r 'recipe[hello_chef_server]' --openstack-floating-ip -VVV


