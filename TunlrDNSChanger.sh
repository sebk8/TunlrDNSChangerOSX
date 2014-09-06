#!/bin/bash
#Created by S.Klingberg, Germany, 8/19/2013
eth="Ethernet"
wifi="Wi-Fi"
exit="0"
clear
while [ $exit != 1 ]
do
echo "################################################################################"
echo "###############              Set Tunlr DNS Server               ################"
echo "################################################################################"
echo "1	Set Tunlr DNS Server  ( 69.197.169.9, 192.95.16.109)"
echo "2	Reset all DNS-Servers on NICs to default settings"
echo "3	Display actual DNS Server Settings "
echo "4	EXIT"
echo "################################################################################"
echo ""
echo "please choose"
read selection
echo "################################################################################"
case $selection in

1)
	echo "Which Network Interface Card (NIC) should be configured?"
	echo "1) Ethernet (en0)"
	echo "2) Airport/Wi-Fi (en1)"
	echo ""
	echo "please choose"
	read interface
	case $interface in
		1)
			sudo networksetup -setdnsservers $eth 69.197.169.9 192.95.16.109
			echo "Tunlr DNS Server for Interface $eth is set"
			;;
		2)
			sudo networksetup -setdnsservers $wifi 69.197.169.9 192.95.16.109
			echo "Tunlr DNS Server for Interface $wifi is set"
			;;
	esac
	exit
	;;

2)
	sudo networksetup -setdnsservers $eth empty
	sudo networksetup -setdnsservers $wifi empty
	clear
	echo "############################################################"
	echo "#####              Reset Interfaces 		             #####"
	echo "############################################################"
	echo "DNS Settings $eth"
	sudo networksetup -getdnsservers $eth
	echo "DNS Settings $wifi"
	sudo networksetup -getdnsservers $wifi
	;;

3)
	echo "############################################################"
	echo "#####        Actually set DNS Server on Iface          #####"
	echo "############################################################"
	echo "DNS Settings $eth"
	sudo networksetup -getdnsservers $eth
	echo "DNS Settings $wifi"
	sudo networksetup -getdnsservers $wifi
	;;
	
4)
	exit=$[$exit+1]
	clear
	;;
	
*)
	echo "You entered something wrong..."
	;;
		

esac
done
echo "Bye!"
exit
