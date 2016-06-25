// Knife OpenStack Plugin:

knife openstack server create -I 8e825674-c0e3-46c0-a101-929b55f3530a -f m1.small -N paisley-bear01 --network-ids 7a7986b9-fe9a-45ee-a72c-76d26de259a1 
--openstack-ssh-key-id scoday-win8 --ssh-user dcia --ssh-password dcia --sudo --no-host-key-verify -G default -r 'recipe[hello_chef_server]' --openstack-float
ing-ip -VVV
