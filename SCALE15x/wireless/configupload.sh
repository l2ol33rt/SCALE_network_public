#!/bin/bash
cd ./configap
for i in $(ls -d */)
do 
#echo ${i%%/} 
scp -r ./"${i%%/}"/* root@"${i%%/}":/etc/config/
ssh root@"${i%%/}" "uci commit"
done
