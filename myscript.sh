#!/bin/bash
#This script does system maintenance
#If you want the script to update all software, specify the 'update' option

#Check to see if first argument of script is 'update' (if so, update software)
if [ $1 = 'update' ]
then
dnf update -y && echo "Update completed at $(date)" >> /var/log/maintenance.log
fi

#This updates the locate database
updatedb && echo "Locate DB updated at $(date)" >> /var/log/maintenance.log

#This creates /backups if it doesn't exist
if [ ! -d /backups ]
then
   mkdir /backups
fi

#This backs up the Oracle DB, website & home directories
tar -zcvf /backups/oraclebackup-$(date +%F).tar.gz /oracle && echo "Oracle DB backed up at $(date)" >> /var/log/maintenance.log
tar -zcvf /backups/webbackup-$(date +%F).tar.gz /var/www/html && echo "Website backed up at $(date)" >> /var/log/maintenance.log
tar -zcvf /backups/homedirs-$(date +%F).tar.gz /home && echo "Home directories backed up at $(date)" >> /var/log/maintenance.log

#This removes temporary Oracle cache files to rebuilt the index
rm -Rf /tmp/oracle* && echo "Oracle temp files cleared at $(date)" >> /var/log/maintenance.log
