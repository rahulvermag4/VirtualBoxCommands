Expand VirtualBox Drive
The first thing you need to do is expand your virtual drive which I did using the VBoxmanage command line tool provided by VirtualBox (reference).

Note: Ensure virtual box root folder is on your path (e.g., C:\Program Files\Oracle\VirtualBox).

Resize the partition with the command VBoxmanage to the desired size in megabytes (e.g., here I am resizing the drive to 20 gigs):

1
VBoxmanage modifyhd MyCentosDisk.vdi --resize 20000
Resize Partition with GParted
Download the gparted live cd.

Attach the gparted live cd as a drive to your virtual machine and make it the “Primary Master”.

Note: Ensure the checkbox “Live CD” is selected when you add the CD drive.

Now start your VM.

The gparted UI will load. Now resize the parition by expanding it to use the available free space on the virtual disk.

Shutdown your VM, remove the gparted live cd drive and set your virtual disk to once again be the “Primary Master” drive.

However, after you restart your VM you will notice that CentOS is still not aware of the additional space:

1
df -h
Expand CentOS Partition
Now you will need to expand your Linux partition to use the free space on the drive.

First check the sizes of the current partitions and get the name:

1
vgdisplay -v
On my system the name of the partition to expand was “/dev/centos/root”.

Extend the volume with the available free space:

1
lvextend -l +100%FREE /dev/centos/root
Now you are ready to perform the online resize:

1
xfs_growfs /dev/centos/root
NOTE: resize2fs works on other distributions of Linux but not on CentoOS, so you must use xfs_growfs (reference).

I hope that helps!




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
