##To config APs
1. Make sure that you have sqlite(apt-get install sqlite3 libsqlite3-dev)
2. Download  APs.csv,  ap.sh and applyapconfig.sh
3. Make any needed changes to the APs.csv
4. Run ap.sh. In the configap folder you will find a folder for each hostname found in the APs.csv. Inside of the hostname folder you will find the config files for opwnwrt. 
5. Run applyapconfig.sh this will scp the config files to every AP found in the APs.csv, then apply the config change. If the config file that is uploaded is the same as already there then when the apply is done there will be no changes. If the config file is diffrent then the whole file will be overwrote with the new config file. During the apply if the running config has a setting that the config file does not then the running config will be changed to match the config file.

##To config switches
1. Make sure that you have sqlite(apt-get install sqlite3 libsqlite3-dev)
2. Download ports.csv, switches.csv, and  makeswconf.sh(you will need to get this file from the private repo)
3. Make any changes to needed to ports.csv and switches.csv. Ports.csv has all of the ports for each switch and what vlan the port should be on. The switches.csv has the hostname and ip of each switch.
4. Run ap.sh. In the configsw folder you will find a text file with the commands needed for each switch.
5. Connect to each switch and copy and paste the command to the switch and watch for errors


##known limitations and problems
1. At this time there is nothing in the switch config code that will remove settings already set on the switch. Example say that you config port 20 for vlan 60 and desc of AP1. Then you decided that AP1 needs to move to port 21. The code will make the new config for port 21 but will not remove anything from 20. You will have to remove by hand.
