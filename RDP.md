1.	sudo apt-get update

2.	sudo apt install xrdp

3.	sudo apt-get install xserver-xorg-core

4.	sudo apt-get install xorgxrdp

5.	nano /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf

6.	Copy the polkit

polkit.addRule(function(action, subject) {
if ((action.id == “org.freedesktop.color-manager.create-device” || action.id == “org.freedesktop.color-manager.create-profile” || action.id == “org.freedesktop.color-manager.delete-device” || action.id == “org.freedesktop.color-manager.delete-profile” || action.id == “org.freedesktop.color-manager.modify-device” || action.id == “org.freedesktop.color-manager.modify-profile”) && subject.isInGroup(“{group}”))
{
return polkit.Result.YES;
}
});

7.	sudo ufw allow 3389/tcp

8.	sudo /etc/init.d/xrdp restart

9.	sudo systemctl status xrdp

10.	sudo systemctl enable xrdp

11.	Get IP address 

12.	Log out of ubuntu
