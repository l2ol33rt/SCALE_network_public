| Command | Description |
| --- | --- |
| git status | List all new or modified files |
| git diff | Show file differences that haven't been staged |
Networks
Network name
Ip range
vlan
Notes
DHCP range
Network management
10.1.0.0/24 
vlan=1
This is for servers, switches, and APs
10.1.0.20 - 10.1.0.250
SCALE-public 2g 
10.40.0.0/21
vlan=40
Guest network
building1
10.40.0.20 - 10.40.8.250
SCALE public 5g
10.41.0.0/21
vlan=41
Guest network
building1
10.41.0.20 - 10.41.8.250
SCALE-public 2g
10.42.0.0/21
vlan=42
Guest network
building2
10.42.0.20 - 10.42.8.250
SCALE public 5g
10.43.0.0/21
vlan=43
Guest network
building2
10.43.0.20 - 10.43.8.250
SCALE Staff
10.60.0.0/23
vlan=60
Connected to the staff wireless network
10.60.0.20 - 10.60.1.250
Reg desk
10.61.0.0/24
Vlan=61


10.61.0.20 - 10.61.0.250
Video
10.70.0.0/24
vlan=70
AV team
10.70.0.20 - 10.70.0.250
Display boards
10.55.0.0/24
vlan 55
For the PI connected to the display boards
10.55.0.20 - 10.55.0.250
Speakers
10.65.0.0/24
vlan 65


10.65.0.20 - 10.65.0.250
Vendors booth
10.x.0.0/24
vlan 100-199
The x in the IP will match the vlan ID
10.x.0.20 - 10.x.0.250
HAM
10.80.0.0/24
vlan=80


10.80.0.20 - 10.80.0.250
All vlans= untag 50, tag 40,41,42,43,55,60,61,65,70,80,100-199
Vlans only for APs=untag 50, tag 60,40,41,42,43


Switches
Ballroom A 2810-24G
Port1 Ballroom A1 AP Vlans only for APs
Port2 Ballroom A2 AP Vlans only for APs
Port3 Ballroom A3 AP Vlans only for APs
Port13 Ballroom A AV untag vlan 70
Port14 Ballroom A AV untag vlan 70
Port 21 Ballroom A speakers  untag vlan 65
Port 24 uplink to Ballroom MDF sw All vlans
Ballroom B 2810-24G
Port1 Ballroom B1 AP Vlans only for APs
Port2 Ballroom B2 AP Vlans only for APs
Port3 Ballroom B3 AP Vlans only for APs
Port4 Ballroom B hallway AP Vlans only for APs
Port15 Ballroom B AV untag vlan 70
Port16 Ballroom B AV untag vlan 70
Port 20 Ballroom B speakers  untag vlan 65
Port24 uplink to Ballroom MDF sw All vlans
Ballroom C 2530-24
Port1 Ballroom C1 AP Vlans only for APs
Port2 Ballroom C2 AP Vlans only for APs
Port3 Ballroom C3 AP Vlans only for APs
Port4 Ballroom C Lobby AP Vlans only for APs
Port11 Ballroom C AV untag vlan 70
Port12 Ballroom C AV untag vlan 70
Port20 Ballroom C speakers  untag vlan 65
Port 23 Display outside of C untag vlan 55
Port 24 Display outside of C untag vlan 55
Port25 uplink to Ballroom MDF sw All vlans
Ballroom DE hp 2530-48G
Port1 Ballroom DE1 AP Vlans only for APs
Port2 Ballroom DE2 AP Vlans only for APs
Port3 Ballroom DE3 AP Vlans only for APs
Port4 Ballroom DE4 AP Vlans only for APs
Port5 Ballroom DE5 AP Vlans only for APs 
Port6 Ballroom DE6 AP Vlans only for APs
Port7 Ballroom DE7 AP Vlans only for APs
Port8 Ballroom D hallway AP Vlans only for APs
Port13 Ballroom DE AV untag vlan 70
Port14 Ballroom DE AV untag vlan 70
Port20 Ballroom DE speakers  untag vlan 65
Port48 uplink to Ballroom MDF sw All vlans
Ballroom F 2810-24G
Port1 Ballroom F1 AP Vlans only for APs
Port2 Ballroom F2 AP Vlans only for APs
Port3 Ballroom F3 AP Vlans only for APs
Port4 Ballroom F hallway AP Vlans only for APs
Port13 Ballroom F AV untag vlan 70
Port14 Ballroom F AV untag vlan 70
Port 20 Ballroom F speakers  untag vlan 65
Port 22 Display outside of F untag vlan 55
Port 23 Display outside of F untag vlan 55
Port 24 uplink to Ballroom MDF sw All vlans
Ballroom G  2530-24
Port1 Ballroom G1 AP Vlans only for APs
Port2 Ballroom G2 AP Vlans only for APs
Port3 Ballroom G3 AP Vlans only for APs
Port4 Ballroom G hallway AP Vlans only for APs
Port11 Ballroom G AV untag vlan 70
Port12 Ballroom G AV untag vlan 70
Port 20 Ballroom G speakers  untag vlan 65
Port 23 Display outside of G untag vlan 55
Port25 uplink to Ballroom MDF sw All vlans
Ballroom H 2810-24G
Port1 Ballroom H1 AP Vlans only for APs
Port2 Ballroom H2 AP Vlans only for APs
Port3 Ballroom H3 AP Vlans only for APs
Port13 Ballroom H AV untag vlan 70
Port14 Ballroom H AV untag vlan 70
Port21 Ballroom H speakers  untag vlan 65
Port24 uplink to Ballroom MDF sw All vlans
Ballroom J hp 2530-24
Port1 Ballroom J1 AP Vlans only for APs
Port2 Ballroom J2 AP Vlans only for APs
Port25 uplink to Ballroom MDF sw All vlans
Ballroom I hp 2530-24
Port1 Ballroom I1 AP Vlans only for APs
Port2 Ballroom I2 AP Vlans only for APs
Port25 uplink to Ballroom MDF sw All vlans
Ballroom MDF sw hp 2530-48G
Port SFP1 uplink to Conference MDF sw  All vlans
Port SFP2 uplink to Conference MDF sw  All vlans
Port 1 downlink to ExhibithallA sw1 All vlans
Port 2 downlink to ExhibithallA sw2 All vlans
Port 3 downlink to ExhibithallB sw1 All vlans
Port 4 downlink to ExhibithallB sw2 All vlans
Port 8 downlink to Ballroom A sw All vlans
Port 9 downlink to Ballroom B sw All vlans
Port 10 downlink to Ballroom C sw All vlans
Port 11  downlink to Ballroom DE sw All vlans
Port 12  downlink to Ballroom F sw All vlans
Port 13  downlink to Ballroom G sw All vlans
Port 14  downlink to Ballroom H sw All vlans
Port 15  downlink to Ballroom I sw All vlans
Port 16 Regdesk All vlans
Conference MDF sw hp 2530-24G
Port SFP1 uplink to Ballroom MDF sw All vlans
Port SFP2 uplink to Ballroom MDF sw All vlans
Port1 Switch room 101/102 downlink All vlans
Port2 Switch room 103 downlink All vlans
Port3 Switch room 104/105 downlink All vlans
Port4 Switch room 107 downlink All vlans
Port5 Switch room 106 downlink All vlans
Port6 Switch room 211 downlink All vlans
Port7 Switch room 210 downlink All vlans
Port8 Switch room 208  downlink All vlans
Port9 Switch room 205 downlink(lag) All vlans
Port10 Switch room 205 downlink(lag) All vlans
Port11 Switch room 215 downlink(lag) All vlans
Port12 Switch room 215 downlink(lag) All vlans
Port13 Switch room 212 downlink All vlans


Switch room 101/102 2610-24
Port 1 room 101 AP Vlans only for APs
Port 2 room 101 AP Vlans only for APs
Port 3 room 102 AP Vlans only for APs
Port 4 room 102 AP Vlans only for APs
Port 5 room 101 hallway AP Vlans only for APs
Port 10 room 102/101 AV untag vlan 70
Port 11 room 102/101  AV untag vlan 70
Port 20 room 102/101   speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 103 2610-24
Port 1 room 103 AP Vlans only for APs
Port 2 room 103 AP Vlans only for APs
Port 12 room 103 AV untag vlan 70
Port 13 room 103 AV untag vlan 70
Port 20 room 103 speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 104/105 2610-24
Port 1 room 105 hallway AP Vlans only for APs
Port 2 room 105 AP Vlans only for APs
Port 3 room 105 AP Vlans only for APs
Port 4 room 104 AP Vlans only for APs
Port 5 room 104 AP Vlans only for APs
Port 11 room 104/105 AV untag vlan 70
Port 12 room 104/105  AV untag vlan 70
Port 13 room 104/105  speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 107 2610-24
Port 1 room 107 AP Vlans only for APs
Port 2 room 107 AP Vlans only for APs
Port 3 room 107 AP Vlans only for APs
Port 4 room 107 hallway AP Vlans only for APs
Port 10 room 107 AV untag vlan 70
Port 11 room 107 AV untag vlan 70
Port 20 room 107 speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 106 2610-24
Port 1 room 106 AP Vlans only for APs
Port 2 room 106 AP Vlans only for APs
Port 3 room 106 AP Vlans only for APs
Port 4 room 106 AP hallway Vlans only for APs
Port 10 room 106 AV untag vlan 70
Port 11 room 106 AV untag vlan 70
Port 20 room 106 speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 211 2610-24
Port 1 room 211 AP Vlans only for APs
Port 2 room 211 AP Vlans only for APs
Port 3 room 211 hallway AP Vlans only for APs
Port 4 room 211 AP* Vlans only for APs
Port 10 room 211 AV untag vlan 70
Port 11 room 211 AV untag vlan 70
Port 20 room 211 speaker untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 210/209 2610-24
Port 1 room 210  AP Vlans only for APs
Port 2 room 209  AP Vlans only for APs
Port 3 room 201 hallway AP Vlans only for APs
Port 10 room 210/209  AV untag vlan 70
Port 11 room 210/209  AV untag vlan 70
Port 20 room 210/209  speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Switch room 208 2610-24(press/speakers)
Port 1 room 208 AP Vlans only for APs
Port 2 room 207 AP Vlans only for APs
Port 10-19 room press/speakers  untag vlan 65
Port 20 display untag vlan 55
Port 25 uplink to Conference MDF sw All vlans


Switch room 205 2530-48G (AV team)
Port 1 room 205 AP Vlans only for APs
Port 2 room 204 hallway AP Vlans only for APs
Port 3 room 204 AP Vlans only for APs
Port 6-44 room 205 AV team untag vlan 70
Port 45 display untag vlan 55
Port47 uplink to Conference MDF sw(lag) All vlans
Port48 uplink to Conference MDF sw(lag) All vlans
Switch room 215  2530-48G (NOC)
Port 1 room 215 AP Vlans only for APs
Port 5-43 NOC ports untag vlan 50
Port 44 unifi server untag vlan50
Port 45 HAM untag vlan 80
Port 46 display untag vlan 55 
Port 47 uplink Conference MDFsw(lag) All vlans
Port 48 uplink Conference MDFsw(lag) All vlans
Switch room 214 2610-24 
Port 1 room 214 AP Vlans only for APs
Port 2 room 214 AP Vlans only for APs
Port 3 room 214 AP* Vlans only for APs
Port 4 room 212 hallway AP Vlans only for APs
Port 10 room 214 AV untag vlan 70
Port 11 room 214 AV untag vlan 70
Port 20 room 214 speaker  untag vlan 65
Port 25 uplink to Conference MDF sw All vlans
Reg desk hp 2530-24 
Port1 Reg desk AP Vlans only for APs
Port 3 display board untaged vlan 55
Port 6-24 reg desk computers untag vlan 61
Port25 uplink to xxxx All vlans
Port26 downlink Reg desk2 All vlans


Reg desk2 2530-24
Port 1-22 reg desk computers untag vlan 61
Port25 uplink to expoA master sw All vlans
ExhibithallB masterswUS-24-250W
Port1 uplink to Ballroom MDF sw All vlans
Port2 downlink to expo1 All vlans
Port3 downlink to expo2  All vlans
Port 10 Exhibithall B hallway AP Vlans only for APs
Port 15 display untag vlan 55
Port 16 display untag vlan 55
ExhibithallA mastersw US-24-250W
Port1 uplink to Ballroom MDF sw All vlans
Port2 Downlink to reg desk sw All vlans
Port3 downlink to expo18 All vlans
Port4 downlink to expo15 All vlans
Port5 downlink to expo12All vlans
Port10 Exhibithall AP8 Vlans only for APs
Port11 Exhibithall AP14 Vlans only for APs
Expo1 2610-24
Port1 Uplink to ExhibithallA mastersw All vlans
Port2 Exhibithall AP1 Vlans only for APs
Port3 Exhibithall AP2 Vlans only for APs
Port 4-16 vendors booths untag vlan xx
Expo2 2610-24
Port1 Uplink to ExhibithallA mastersw All vlans
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo3 All vlans
Expo3 2610-24
Port1 Uplink to expo2 All vlans
Port2 Exhibithall AP3 Vlans only for APs
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo4 All vlans
Expo4 2610-24
Port1 Uplink to expo3 All vlans
Port 4-16 vendors booths untag vlan xx
Expo5 2610-24
Port1 Uplink to ExhibithallA mastersw All vlans
Port2 Exhibithall AP4 Vlans only for APs
Port 4-14 vendors booths untag vlan xx
Port15 downlink to expo6 All vlans
Port16 downlink to expo8 All vlans
Expo6 2610-24
Port1 Uplink to expo5 All vlans
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo7 All vlans
Expo7 2610-24
Port1 Uplink to expo6 All vlans
Port2 Exhibithall AP10 Vlans only for APs
Port 4-16 vendors booths untag vlan xx
Expo8 2620-24
Port1 Uplink to expo5 All vlans
Port 2 Exhibithall AP12 Vlans only for APs
Port 4-16 vendors booths untag vlan xx
Expo9 2610-24
Port1 Uplink to expo12 All vlans
Port2 Exhibithall AP9 Vlans only for APs
Port 4-16 vendors booths untag vlan xx
Expo10 2610-24
Port1 Uplink to expo11 All vlans
Port2 Exhibithall AP16 Vlans only for APs
Port 4-16 vendors booths untag vlan xx
Expo11 2610-24
Port1 Uplink to expo12 All vlans
Port 4-15 vendors booths untag vlan xx
Port 16 downlink to expo10 All vlans
Expo12 2610-24
Port1 Uplink to ExhibithallB mastersw All vlans
Port2 Exhibithall AP11 Vlans only for APs
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo11All vlans
Expo13 3com ancient
Port1 Uplink to expo14 All vlans
Port 4-16 vendors booths untag vlan xx
Expo14 US‑16‑150W
Port1 Uplink to expo15 All vlans
Port2 Exhibithall AP13 Vlans only for APs
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo13 All vlans
Expo15 3com ancient
Port1 Uplink to ExhibithallB masterswAll vlans
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo14 All vlans
Expo16 3com ancient
Port1 Uplink to expo17 All vlans
Port2 Exhibithall AP7 Vlans only for APs
Port 4-16 vendors booths untag 80
Expo17 3com ancient
Port1 Uplink to expo18 All vlans
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo16 All vlans


Expo18 3com ancient
Port1 Uplink to ExhibithallB masterswAll vlans
Port2 Exhibithall AP5 Vlans only for APs
Port 4-15 vendors booths untag vlan xx
Port16 downlink to expo17 All vlans






Total=87
Ballroom/expo=8+8+7+27=50
Conf area=27+10=37
