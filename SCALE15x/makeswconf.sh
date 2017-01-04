#!/bin/bash
##This cleans up from an hold run
rm -f config.db
rm -fr ./config
mkdir ./config
##This reads the makes the new sqlite database
sqlite3 config.db "CREATE TABLE ports (Switch TEXT,Portnumber TEXT,Portdescription TEXT,Vlanstag TEXT,Vlansuntag TEXT);"
sqlite3 config.db "CREATE TABLE switches (Switchhostname TEXT,Ipaddress TEXT,Model TEXT);"
##this reads in the csv into the sqlite database
echo -e ".separator ","\n.import switches.csv switches" | sqlite3 config.db
echo -e ".separator ","\n.import ports.csv ports" | sqlite3 config.db
##This starts a loop that reads all of the data of the switches table from the sqlite database
switchLIST=`sqlite3 config.db "SELECT * FROM switches WHERE 1"`;
for ROW in $switchLIST; do
##This is taking the line gotten from sqlite and breaking into vars
Switchhostname=`echo $ROW | awk '{split($0,a,"|"); print a[1]}'`
Ipaddress=`echo $ROW | awk '{split($0,a,"|"); print a[2]}'`
Model=`echo $ROW | awk '{split($0,a,"|"); print a[3]}'`
##This is making a config file for each switch found in the sqlite database
touch ./config/$Switchhostname
##This is placing global config settings that apply to all switches
echo "hostname $Switchhostname" >> ./config/$Switchhostname
echo "time timezone 60" >> ./config/$Switchhostname 
echo "pulling ports for $Switchhostname"
##This is starting a loop to pull ports for each switch
matchswitch=`sqlite3 config.db "select * from ports where Switch = '$Switchhostname'";`
for ROWs in $matchswitch; do
##this is settings vars for each port found in the database
Switch=`echo $ROWs | awk '{split($0,a,"|"); print a[1]}'`
Portnumber=`echo $ROWs | awk '{split($0,a,"|"); print a[2]}'`
Portdescription=`echo $ROWs | awk '{split($0,a,"|"); print a[3]}'`
Vlanstag=`echo $ROWs | awk '{split($0,a,"|"); print a[4]}'`
Vlansuntag=`echo $ROWs | awk '{split($0,a,"|"); print a[5]}'`
##This is settings the ports config into the config file
echo "interface $Portnumber name $Portdescription" >> ./config/$Switchhostname
##This is the closing for the port loop
done
echo "move to next sw"
##This is the closing for the switch loop
done
