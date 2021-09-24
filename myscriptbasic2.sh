#!/bin/bash
updatedb 
tar -zcvf /backups/oraclebackup-$(date +%F).tar.gz /oracle 
tar -zcvf /backups/webbackup-$(date +%F).tar.gz /var/www/html 
tar -zcvf /backups/homedirs-$(date +%F).tar.gz /home 
rm -Rf /tmp/oracle* 
