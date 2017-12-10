#!/bin/bash

NOW=$(date +"%m-%d-%Y")
FILE="backup-collectif.$NOW.tar.gz"

rm -rf /root/backup/toBackup
mkdir /root/backup/toBackup

docker exec wordpressdocker_mysql_1 sh -c 'exec mysqldump --all-databases -uroot -p""' > /root/backup/toBackup/collectif.sql
cp -r /root/wordpress/wp-content /root/backup/toBackup/

tar cvf /root/backup/$FILE /root/backup/toBackup

rm -rf /root/backup/toBackup
