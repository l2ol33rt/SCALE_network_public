#Networks
| Network name | Ip range v4 | Ip range v6 | vlan | Notes | DHCP range |
| --- | --- | --- | --- | --- | --- |
| Network management | 10.1.0.0/24 | 2001:470:f3fc:1::/64 | vlan=1 | This is for servers, switches, and APs | 10.1.0.100 - 10.1.0.250 |
| SCALE-public 2g  | 10.40.0.0/21 | 2001:470:f3fc:40::/64 | vlan=40 | Guest network conf building | 10.40.0.20 - 10.40.8.250 |
| SCALE public 5g | 10.41.0.0/21 | 2001:470:f3fc:41::/64 | vlan=41 | Guest network conf building | 10.41.0.20 - 10.41.8.250 |
| SCALE-public 2g  | 10.42.0.0/21 | 2001:470:f3fc:42::/64 | vlan=42 | Guest network expo building | 10.42.0.20 - 10.42.8.250 |
| SCALE public 5g | 10.43.0.0/21 | 2001:470:f3fc:43::/64 | vlan=43 | Guest network expo building | 10.43.0.20 - 10.43.8.250 |
| SCALE Staff  | 10.60.0.0/23 | 2001:470:f3fc:60::/64 | vlan=60 | Connected to the staff wireless network | 10.60.0.20 - 10.60.1.250 |
| Reg desk  | 10.61.0.0/24 | 2001:470:f3fc:61::/64 | vlan=61 | | 10.61.0.20 - 10.61.0.250 |
| Video  | 10.70.0.0/24 | No ip v6 | vlan=70 | AV team | 10.70.0.20 - 10.70.0.250 |
| Display boards  | 10.55.0.0/24 | 2001:470:f3fc:55::/64 | vlan=55 | For the PI connected to the display boards | 10.55.0.20 - 10.55.0.250 |
| Speakers  | 10.65.0.0/24 | 2001:470:f3fc:65::/64 | vlan=65 |  | 10.65.0.20 - 10.65.0.250 |
| Vendors booth  | 10.xx.0.0/24 | 2001:470:f3fc:100-199::/64 | vlan=100-199 | The x in the IP will match the vlan ID | 10.x.0.20 - 10.x.0.250 |
| HAM  | 10.80.0.0/24 | 2001:470:f3fc:80::/64 | vlan=80 |  | 110.80.0.20 - 10.80.0.250 |

All vlans= untag 50, tag 40,41,42,43,55,60,61,65,70,80,100-199
Vlans only for APs=untag 50, tag 60,40,41,42,43

#Ips
- openwisp=10.1.0.2
- snmp/nms=10.1.0.3
- syslog/graylog=10.1.0.4
- ntp/sntp=10.1.0.5

#Switches

##Reg desk2 3com ancient##
- Port 1-22 reg desk computers untag vlan 61
- Port 25 uplink to expoA master sw All vlans

##Expo14##
- Port 1 Uplink to expo15 All vlans
- Port 2 Exhibithall AP13 Vlans only for APs
- Port 4-15 vendors booths untag vlan xx
- Port 16 downlink to expo13 All vlans

##Expo15 3com ancient##
- Port 1 Uplink to ExhibithallB masterswAll vlans
- Port 4-15 vendors booths untag vlan xx
- Port 16 downlink to expo14 All vlans

##Expo16 3com ancient##
- Port 1 Uplink to expo17 All vlans
- Port 2 Exhibithall AP7 Vlans only for APs
- Port 4-16 vendors booths untag 80

##Expo17 3com ancient##
- Port 1 Uplink to expo18 All vlans
- Port 4-15 vendors booths untag vlan xx
- Port 16 downlink to expo16 All vlans

##Expo18 3com ancient##
- Port 1 Uplink to ExhibithallB masterswAll vlans
- Port 2 Exhibithall AP5 Vlans only for APs
- Port 4-15 vendors booths untag vlan xx
- Port 16 downlink to expo17 All vlans

Total=87
Ballroom/expo=8+8+7+27=50
Conf area=27+10=37
