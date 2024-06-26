#!/bin/bash

sed -i -e "s/ssl:helix-p4d:1666/${P4PORT}/g" /etc/perforce/p4dctl.conf.d/p4p-master.conf

p4 trust -y -f
yes $P4PASSWD | p4 login
sudo -E -u perforce yes $P4PASSWD | p4 login
cat /root/.p4trust > /opt/perforce/.p4trust
cat /root/.p4tickets > /opt/perforce/.p4tickets

sudo service cron start
sudo -E -u perforce p4dctl start -t p4p p4p-master

exec /usr/bin/tail -f ${P4PLOGFILE}