:: AUTHOR: "RAHUL VERMA rahul.verma@incedoinc.com"
:: _________________________________________________
@echo off
set vboxmanage_cmd="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set vm_name="opedge-emu"
set master_nic="Intel(R) Wireless-AC 9560 160MHz"
echo ###############################################
echo #     Attach More Than 4 Network Adapters     #
echo #        Guest Name: %vm_name%                #
echo ###############################################
echo.

echo ###############################################
echo "Setting Adapter 5"
echo ###############################################
%vboxmanage_cmd% modifyvm %vm_name% --bridgeadapter5 %master_nic%
%vboxmanage_cmd% modifyvm %vm_name% --nic5 bridged
%vboxmanage_cmd% modifyvm %vm_name% --macaddress5 auto
%vboxmanage_cmd% modifyvm %vm_name% --cableconnected5 on

echo ###############################################
echo "Setting Adapter 6"
echo ###############################################
%vboxmanage_cmd% modifyvm %vm_name% --bridgeadapter6 %master_nic%
%vboxmanage_cmd% modifyvm %vm_name% --nic6 bridged
%vboxmanage_cmd% modifyvm %vm_name% --macaddress6 auto
%vboxmanage_cmd% modifyvm %vm_name% --cableconnected6 on

echo ###############################################
echo "Setting Adapter 7"
echo ###############################################
%vboxmanage_cmd% modifyvm %vm_name% --bridgeadapter7 %master_nic%
%vboxmanage_cmd% modifyvm %vm_name% --nic7 bridged
%vboxmanage_cmd% modifyvm %vm_name% --macaddress7 auto
%vboxmanage_cmd% modifyvm %vm_name% --cableconnected7 on

echo ###############################################
echo "(Please note the error code if any)"
echo ###############################################
pause

REM echo ###############################################
REM echo "Setting Adapter 8"
REM echo ###############################################
REM %vboxmanage_cmd% modifyvm %vm_name% --bridgeadapter8 %master_nic%
REM %vboxmanage_cmd% modifyvm %vm_name% --nic8 bridged
REM %vboxmanage_cmd% modifyvm %vm_name% --macaddress8 auto
REM %vboxmanage_cmd% modifyvm %vm_name% --cableconnected8 on
REM %vboxmanage_cmd% modifyvm %vm_name% --nic<5-8> none|null|nat|bridged|intnet|hostonly|generic|natnetwork
REM %vboxmanage_cmd% modifyvm %vm_name% --nictype<5-8> Am79C970A|Am79C973|82540EM|82543GC|82545EM|virtio
REM %vboxmanage_cmd% modifyvm %vm_name% --macaddress<5-8> auto|<mac>
REM %vboxmanage_cmd% modifyvm %vm_name% --cableconnected<5-8> on|off