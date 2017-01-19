#!/bin/bash
##This cleans up from an hold run
rm -f configap.db
rm -fr ./configap
mkdir ./configap
##This reads the makes the new sqlite database
sqlite3 configap.db "CREATE TABLE aps (Hostname TEXT,ip TEXT,power5g TEXT,freq5g TEXT,power2g TEXT,freq2g TEXT,mac TEXT,building TEXT);"
##this reads in the csv into the sqlite database
echo -e ".separator ","\n.import APs.csv aps" | sqlite3 configap.db
##This starts a loop that reads all of the data of the aps table from the sqlite database looking for the aps for the expo building
expoapLIST=`sqlite3 configap.db "select * from aps where building = 'expo'";`
for ROW in $expoapLIST; do
##This is taking the line gotten from sqlite and breaking into vars
Hostname=`echo $ROW | awk '{split($0,a,"|"); print a[1]}'`
ip=`echo $ROW | awk '{split($0,a,"|"); print a[2]}'`
power5g=`echo $ROW | awk '{split($0,a,"|"); print a[3]}'`
freq5g=`echo $ROW | awk '{split($0,a,"|"); print a[4]}'`
power2g=`echo $ROW | awk '{split($0,a,"|"); print a[5]}'`
freq2g=`echo $ROW | awk '{split($0,a,"|"); print a[6]}'`
mac=`echo $ROW | awk '{split($0,a,"|"); print a[7]}'`
building=`echo $ROW | awk '{split($0,a,"|"); print a[8]}'`
##This is making a config file for each switch found in the sqlite database
echo "making config for $Hostname"
mkdir ./configap/$Hostname
##this is the start of the building of the openwrt config files
echo "config wifi-device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option type 'mac80211'" >> ./configap/$Hostname/wireless
echo "	option channel '$freq2g'" >> ./configap/$Hostname/wireless
echo "	option hwmode '11g'" >> ./configap/$Hostname/wireless
echo "	option path 'pci0000:00/0000:00:11.0'" >> ./configap/$Hostname/wireless
echo "	option htmode 'HT20'" >> ./configap/$Hostname/wireless
echo "	option txpower '$power2g'" >> ./configap/$Hostname/wireless
echo "	option country 'US'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option type 'mac80211'" >> ./configap/$Hostname/wireless
echo "	option hwmode '11a'" >> ./configap/$Hostname/wireless
echo "	option path 'pci0000:00/0000:00:12.0'" >> ./configap/$Hostname/wireless
echo "	option htmode 'HT20'" >> ./configap/$Hostname/wireless
echo "	option channel 'freq5g'" >> ./configap/$Hostname/wireless
echo "	option txpower '$power5g'" >> ./configap/$Hostname/wireless
echo "	option country 'US'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Staff'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'Password'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan60'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Staff'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan60'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Public fast'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan43'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE public'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan42'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless

echo "config interface 'loopback'" >> ./configap/$Hostname/network
echo "	option ifname 'lo'" >> ./configap/$Hostname/network
echo "	option proto 'static'" >> ./configap/$Hostname/network
echo "	option ipaddr '127.0.0.1'" >> ./configap/$Hostname/network
echo "	option netmask '255.0.0.0'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config globals 'globals'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'lan'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.1'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option _orig_ifname 'eth0.1 radio0.network1 radio1.network1'" >> ./configap/$Hostname/network
echo "	option _orig_bridge 'true'" >> ./configap/$Hostname/network
echo "	option proto 'dhcp'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch" >> ./configap/$Hostname/network
echo "	option name 'switch0'" >> ./configap/$Hostname/network
echo "	option reset '1'" >> ./configap/$Hostname/network
echo "	option enable_vlan '1'" >> ./configap/$Hostname/network
echo "	option blinkrate '2'" >> ./configap/$Hostname/network
echo "	option enable_vlan4k '1'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option vlan '1'" >> ./configap/$Hostname/network
echo "	option ports '0 5t'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port " >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '1'" >> ./configap/$Hostname/network
echo "	option led '6'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '2'" >> ./configap/$Hostname/network
echo "	option led '9'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '5'" >> ./configap/$Hostname/network
echo "	option led '2'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo "	option vlan '42'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan42'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.42'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option vlan '43'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo "	option vlan '60'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan43'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.43'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan60'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.60'" >> ./configap/$Hostname/network

echo "config system" >> ./configap/$Hostname/system
echo "        option hostname '$Hostname'" >> ./configap/$Hostname/system
echo "        option zonename 'America/Los Angeles'" >> ./configap/$Hostname/system
echo "        option timezone 'PST8PDT,M3.2.0,M11.1.0'" >> ./configap/$Hostname/system
echo "        option conloglevel '8'" >> ./configap/$Hostname/system
echo "        option cronloglevel '8'" >> ./configap/$Hostname/system
echo "        option log_ip '10.1.0.4'" >> ./configap/$Hostname/system
echo " " >> ./configap/$Hostname/system
echo "config timeserver 'ntp'" >> ./configap/$Hostname/system
echo "        list server '0.openwrt.pool.ntp.org'" >> ./configap/$Hostname/system
echo "        list server '1.openwrt.pool.ntp.org'" >> ./configap/$Hostname/system
echo "        list server '2.openwrt.pool.ntp.org'" >> ./configap/$Hostname/system
echo "        list server '3.openwrt.pool.ntp.org'" >> ./configap/$Hostname/system
echo "        option enabled '1'" >> ./configap/$Hostname/system
echo "        option enable_server '0'" >> ./configap/$Hostname/system
echo " " >> ./configap/$Hostname/system
echo "config led 'led_wan'" >> ./configap/$Hostname/system
echo "        option name 'WAN LED (green)'" >> ./configap/$Hostname/system
echo "        option sysfs 'netgear:green:wan'" >> ./configap/$Hostname/system
echo "        option default '0'" >> ./configap/$Hostname/system
echo " " >> ./configap/$Hostname/system
echo "config led 'led_usb'" >> ./configap/$Hostname/system
echo "        option name 'USB'" >> ./configap/$Hostname/system
echo "        option sysfs 'netgear:green:usb'" >> ./configap/$Hostname/system
echo "        option trigger 'usbdev'" >> ./configap/$Hostname/system
echo "       option dev '1-1'" >> ./configap/$Hostname/system
 echo "       option interval '50'" >> ./configap/$Hostname/system

##This is going to build the needed list for the dhcp and dns config files.
echo "$Hostname   IN  A      $ip" >> ./configap/bind.conf
echo "host $Hostname         { hardware ethernet $mac; fixed-address $ip;   }"  >> ./configap/dhcp.conf
##This ends the loop for the expo APs
done
##This cleans the vars
unset Hostname
unset ip
unset power5g
unset freq5g
unset power2g
unset mac
unset building
##This starts a loop that reads all of the data of the aps table from the sqlite database looking for the aps for the conf building
confapLIST=`sqlite3 configap.db "select * from aps where building = 'conf'";`
for ROW in $confapLIST; do
##This is taking the line gotten from sqlite and breaking into vars
Hostname=`echo $ROW | awk '{split($0,a,"|"); print a[1]}'`
ip=`echo $ROW | awk '{split($0,a,"|"); print a[2]}'`
power5g=`echo $ROW | awk '{split($0,a,"|"); print a[3]}'`
freq5g=`echo $ROW | awk '{split($0,a,"|"); print a[4]}'`
power2g=`echo $ROW | awk '{split($0,a,"|"); print a[5]}'`
freq2g=`echo $ROW | awk '{split($0,a,"|"); print a[6]}'`
mac=`echo $ROW | awk '{split($0,a,"|"); print a[7]}'`
building=`echo $ROW | awk '{split($0,a,"|"); print a[8]}'`
##This is making a config file for each switch found in the sqlite database
echo "making config for $Hostname"
mkdir ./configap/$Hostname
##this is the start of the building of the openwrt config files
echo "config wifi-device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option type 'mac80211'" >> ./configap/$Hostname/wireless
echo "	option channel '$freq2g'" >> ./configap/$Hostname/wireless
echo "	option hwmode '11g'" >> ./configap/$Hostname/wireless
echo "	option path 'pci0000:00/0000:00:11.0'" >> ./configap/$Hostname/wireless
echo "	option htmode 'HT20'" >> ./configap/$Hostname/wireless
echo "	option txpower '$power2g'" >> ./configap/$Hostname/wireless
echo "	option country 'US'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option type 'mac80211'" >> ./configap/$Hostname/wireless
echo "	option hwmode '11a'" >> ./configap/$Hostname/wireless
echo "	option path 'pci0000:00/0000:00:12.0'" >> ./configap/$Hostname/wireless
echo "	option htmode 'HT20'" >> ./configap/$Hostname/wireless
echo "	option channel 'freq5g'" >> ./configap/$Hostname/wireless
echo "	option txpower '$power5g'" >> ./configap/$Hostname/wireless
echo "	option country 'US'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Staff'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'Password'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan60'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Staff'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan60'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio1'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE Public fast'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan41'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless
echo " " >> ./configap/$Hostname/wireless
echo "config wifi-iface" >> ./configap/$Hostname/wireless
echo "	option device 'radio0'" >> ./configap/$Hostname/wireless
echo "	option mode 'ap'" >> ./configap/$Hostname/wireless
echo "	option ssid 'SCALE public'" >> ./configap/$Hostname/wireless
echo "	option network 'vlan40'" >> ./configap/$Hostname/wireless
echo "	option encryption 'psk2'" >> ./configap/$Hostname/wireless
echo "	option key 'password'" >> ./configap/$Hostname/wireless

echo "config interface 'loopback'" >> ./configap/$Hostname/network
echo "	option ifname 'lo'" >> ./configap/$Hostname/network
echo "	option proto 'static'" >> ./configap/$Hostname/network
echo "	option ipaddr '127.0.0.1'" >> ./configap/$Hostname/network
echo "	option netmask '255.0.0.0'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config globals 'globals'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'lan'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.1'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option _orig_ifname 'eth0.1 radio0.network1 radio1.network1'" >> ./configap/$Hostname/network
echo "	option _orig_bridge 'true'" >> ./configap/$Hostname/network
echo "	option proto 'dhcp'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch" >> ./configap/$Hostname/network
echo "	option name 'switch0'" >> ./configap/$Hostname/network
echo "	option reset '1'" >> ./configap/$Hostname/network
echo "	option enable_vlan '1'" >> ./configap/$Hostname/network
echo "	option blinkrate '2'" >> ./configap/$Hostname/network
echo "	option enable_vlan4k '1'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option vlan '1'" >> ./configap/$Hostname/network
echo "	option ports '0 5t'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port " >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '1'" >> ./configap/$Hostname/network
echo "	option led '6'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '2'" >> ./configap/$Hostname/network
echo "	option led '9'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_port" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option port '5'" >> ./configap/$Hostname/network
echo "	option led '2'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo "	option vlan '40'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan40'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.40'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option vlan '41'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config switch_vlan" >> ./configap/$Hostname/network
echo "	option device 'switch0'" >> ./configap/$Hostname/network
echo "	option ports '0t'" >> ./configap/$Hostname/network
echo "	option vlan '60'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan41'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.41'" >> ./configap/$Hostname/network
echo " " >> ./configap/$Hostname/network
echo "config interface 'vlan60'" >> ./configap/$Hostname/network
echo "	option type 'bridge'" >> ./configap/$Hostname/network
echo "	option proto 'none'" >> ./configap/$Hostname/network
echo "	option ifname 'eth0.60'" >> ./configap/$Hostname/network
##This is going to build the needed list for the dhcp and dns config files.
echo "$Hostname   IN  A      $ip" >> ./configap/bind.conf
echo "host $Hostname         { hardware ethernet $mac; fixed-address $ip;   }"  >> ./configap/dhcp.conf
##This ends the loop for the expo APs
done

