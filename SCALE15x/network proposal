# Test
* *Router/Internet connection**
We will get the internet access from the upstream isp using fiber. This would connect to pfsense based router. The wan connection will probably be rj45 copper but since I have not see wan connection or server that is going to house pfsense I can't be fore sure. The pfsense will do all of the WAN based routing, NAT, ipv6 tunnel end point, and intervlan router. If server has more than 2 NICs this vlan traffic will be split on to different lan NICs. If the server only has 2 nic this all vlans will trunked on a single interface. A squid proxy will be using on this hardware too since it will be the default gateway for the network but the cache files from will be stored on another server. Squid will be setup as a transparent proxy so that no client setup will need to be done. The pfsense router would be housed if possible in the same location as the upstream isp hand off. If not then the WAN connection will we connected to a core switched and brought up to NOC as a vlan to meet the pfsense router.


Switches
As proposed at this time there are 44 switches in the network. As of now the plan is to manage the switches as standalone using the building web gui or cli. Where possible like between the NOC/AV NOC and core switch or between the core switches in the each building there will be a 2gb LAG. The network is laid out into a hub and spoke with a hub in each building.  All of the switches would act in a layer 2 mode only. All layer 3 roles would be handed by the pfsense router.


AV team
For the AV team we will provide them with 3 network drops(maybe 4 total) per room with a speaker  The drops will be used for camera, laptop video capture device and speaker’s laptop. There will be one camera per room with a speaker. If there is free ports, one port will be AV network to allow for debugging. The speakers laptop will be on a speaker’s vlan. At the AV team command center there will be a 24 port switch with a 2gb uplink to the IDF/MDF. Also AV team will run their own dhcp server for the AV  network. We will not have ipv6 on this network since tech team would not control the ipv4 network.


Wireless
The network is based on 87 APs with 25 of them  EA8500 and the rest split between wndr3800 and wndr3700v2. If there are any left over APs a few will be set aside as spares and the others will be placed on the floor for areas that need more capacity. The EA8500 is a 802.11AC wave2 based AP that will be used in the ballroom where the largest load will be. The EA8500 supports mu-mimo which will allow the AP better performance with large number of connected clients over older APs.


I will set the power levels a little higher of the 5ghz band so that clients will pick 5ghz more often. 


I will enabled the greatest number of features that the hardware and openwrt firmware supports. Below are example of some of the features that I will try to enable.
minRSSI(This is used to help older clients move between access points)
802.11r(Fast Basic Service Set Transition (FT) to authenticate more quickly)
802.11k(This allows the AP to give a list of nearby APs so when the client moves it can quickly connection to a new AP)
802.11v(This allows the AP to influence client roaming behavior by providing it the load information of nearby APs.
Band steering(This allows for AP to help clients more to 5ghz on a mixed band ssid)
airtime fairness( prioritize clients based on their link rate so that instead of everyone getting an equal slice of bandwidth, they get an equal slice of airtime.)
possible 802.11u(This will allow transmission of pre-connection information to prospective users and allow the client devices to auto connection)
Possible 802.11w(Protected Management Frames to stop deauth attacks)


Wireless networks
Under this proposal there would be 3 SSIDs 
	SSID NAME=description 
SCALE-public 2g slow=This would be a 2.4ghz only network and be an WPA2 PSK network.
SCALE public 5g fast=This would be a 5ghz only network and be an WPA2 PSK network.
somename=This would be the staff network and would be a mixed band network with WPA2 PSK encryption.


Management
I will try and get  openwisp2 openwrt controller working for controlling all of the APs from the central location.  If that fails then I would fall back on  ansible for config management. 


Monitoring
An opensouce option like zabbix, opennms, or librenms will be used. 


Network services
The network services of monitoring, dns, syslog, file server/local repo,caching, dhcp server would be housed in the NOC. Each service would be on its own OS in a VM or installed on bare hardware. The pfsense router  would do dhcp relay since it would the default gateway for each vlan.






