# Network Proposal
##Router/Internet connection
We will get the internet access from the upstream isp using fiber. This would connect to pfsense based router. The wan connection will probably be rj45 copper but since I have not see wan connection or server that is going to house pfsense I can't be fore sure. The pfsense will do all of the WAN based routing, NAT, ipv6 tunnel end point, and intervlan router. If server has more than 2 NICs this vlan traffic will be split on to different lan NICs. If the server only has 2 nic this all vlans will trunked on a single interface. The pfsense router would be housed if possible in the same location as the upstream isp hand off. If not then the WAN connection will we connected to a core switched and brought up to NOC as a vlan to meet the pfsense router.


##Switches
As proposed at this time there are 44 switches in the network. As of now the plan is to manage the switches as standalone using the building web gui or cli. Where possible like between the NOC/AV NOC and core switch or between the core switches in the each building there will be a 2gb LAG. The network is laid out into a hub and spoke with a hub in each building.  All of the switches would act in a layer 2 mode only. All layer 3 roles would be handed by the pfsense router.


##AV team
For the AV team we will provide them with 4 network drops per room with a speaker  The drops will be used for camera, laptop video capture device and speaker’s laptop. There will be one camera per room with a speaker. If there is free ports, one port will be AV network to allow for debugging. The speakers laptop will be on a speaker’s vlan. At the AV team command center there will be a 24 port switch with a 2gb uplink to the IDF/MDF. Also AV team will run their own dhcp server for the AV  network. We will not have ipv6 on this network since tech team would not control the ipv4 network.


##Wireless
The network is based on 87 APs split between wndr3800 and wndr3700v2. If there are any left over APs a few will be set aside as spares and the others will be placed on the floor for areas that need more capacity. 

I will set the power levels a little higher of the 5ghz band so that clients will pick 5ghz more often. 

I will enabled the greatest number of features that the hardware and openwrt firmware supports. Below are example of some of the features that I will try to enable.
- minRSSI(This is used to help older clients move between access points)
- 802.11r(Fast Basic Service Set Transition (FT) to authenticate more quickly)
- 802.11k(This allows the AP to give a list of nearby APs so when the client moves it can quickly connection to a new AP)
- 802.11v(This allows the AP to influence client roaming behavior by providing it the load information of nearby APs.
- Band steering(This allows for AP to help clients more to 5ghz on a mixed band ssid)
- Airtime fairness( prioritize clients based on their link rate so that instead of everyone getting an equal slice of bandwidth, they get an equal slice of airtime.)
- Possible 802.11u(This will allow transmission of pre-connection information to prospective users and allow the client devices to auto connection)
- Possible 802.11w(Protected Management Frames to stop deauth attacks)


##Wireless networks
Under this proposal there would be 3 SSIDs 
- **SSID NAME=description**
- SCALE-public 2g slow=This would be a 2.4ghz only network and be an WPA2 PSK network.
- SCALE public 5g fast=This would be a 5ghz only network and be an WPA2 PSK network.
- somename=This would be the staff network and would be a mixed band network with WPA2 PSK encryption.


##Management
I will try and get  openwisp2 openwrt controller working for controlling all of the APs from the central location.  If that fails then I would fall back on  ansible for config management. I will be building a custom version of openwrt so that APs will auto check in with openwisp. The changes will include the hostname and key for openwisp and setting openwrt to default to dhcp when booting.


##Monitoring
An opensouce option like zabbix, opennms, or librenms will be used. As of (1-12-2017) librenms looks like it will be used at the nms of the network.


##Network services
The network services of monitoring, dns, syslog, file server/local repo,caching, dhcp server would be housed in the NOC. Each service would be on its own OS in a VM or installed on bare hardware. 
- Dhcp relay=This will be the pfsense router since it will be the default gateway for all of the vlans. Dhcp will not be on AV vlan since tech will not manage the dhcp for that network. Dhcp relay will not be needed for vlan 1 as the dhcp server will also live on vlan 1 and can listen for dhcp requests.
- Proxy=Squid will be setup as a transparent proxy so that no client setup will need to be done. Squid will be installed on another server and pfsense will redirect port 80/tcp(not touching 443/tcp) of all outgoing request to the public internet to the proxy ip. 
- syslog=We will be using graylog
- Dns=There will be two dns servers that will act as authoritative and caching forwarding nameserver for all clients.


##Firewall rules






