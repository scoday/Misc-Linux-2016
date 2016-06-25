// Windows Image Creation:

// Create the image for installation
# qemu-img create -f qcow2 ws2012.qcow2 15G

// Begin the installation
# virt-install --connect qemu:///system \
  --name ws2012 --ram 2048 --vcpus 2 \
  --network network=default,model=virtio \
  --disk path=/home/images/ws2012.qcow2,format=qcow2,device=disk,bus=virtio \
  --cdrom /home/images/IMAGE_BUILD/W2k12x64.iso \
  --disk path=/home/images/IMAGE_BUILD/virtio-win-0.1.102.iso,device=cdrom \
  --vnc --os-type windows --os-variant win2k8

# virt-install --connect qemu:///system --name qws2012 --ram 2048 \
  --vcpus 2   --network network=default,model=virtio \
  --disk path=/home/images/ws2012.qcow2,format=qcow2,device=disk,bus=virtio \
  --cdrom /home/images/IMAGE_BUILD/W2k12x64.iso \
  --disk path=/home/images/IMAGE_BUILD/virtio-win-0.1.102.iso,device=cdrom \
  --vnc --os-type windows --os-variant win2k8

// Moved the qcow2 into the IMAGE_BUILD directory. Also lobbed off the
// directory calls to the isos.

# virt-install --connect qemu:///system \
  --name ws2012 --ram 2048 --vcpus 2 \
  --network network=default,model=virtio \
  --disk path=ws2012.qcow2,format=qcow2,device=disk,bus=virtio \
  --cdrom en_windows_server_2012_x64_dvd.iso \
  --disk path=virtio-win-0.1.102.iso,device=cdrom \
  --vnc --os-type windows --os-variant win2k8

// ANOTHER Windows image method. This one from HPE for Helion //
virt-install --connect qemu:///system --name ws2012v2 --ram 2048 --vcpus 2 -\
-network network=default,model=rtl8139 --disk path=ws2012-v2.qcow2,format=qcow2,device=disk,bus=ide \
--cdrom en_windows_server_2012_x64_dvd.iso --vnc --os-type windows --os-variant win2k8

// Upload image to OpenStack
(keystone_admin)]$ glance image-create --name WS2012v2 --disk-format qcow2 --container-format bare --is-public true --file ws2012v2.qcow2

// Add the IDE 'stuff' 
(keystone_admin)]$ glance image-update WS2012v2 --property os_type=windows --property hw_disk_bus=ide --property hw_vif_model=rtl8139

