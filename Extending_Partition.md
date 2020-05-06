fdisk
Use fdisk -l to list devices, then e.g. fdisk /dev/sda to add another primary partition (command n), 
next free number (e.g. 3), of type 8e (Linux LVM) (t), print part table (p), write table (w). Reboot…

Add new partition as physical volume (PV)
[root@ccloud12 ~]# lvm

lvm> pvcreate /dev/sda3
 Physical volume "/dev/sda3" successfully created
 check run vgdisplay and remember VG  name
Extend existing volume group (VG)
lvm> vgextend  /dev/sda3
 Volume group "centos" successfully extended
Find out partition name
lvm> lvdisplay
 --- Logical volume ---
 LV Path /dev/centos/root
Extend logical volume
lvm> lvextend -L+8.48G /dev/centos/root
 Rounding size to boundary between physical extents: 8.48 GiB
 Extending logical volume centos to 25.56 GiB
 Logical volume centos successfully resized
Resize the File System (Guest System)
xfs_growfs /dev/centos/root
df -h
