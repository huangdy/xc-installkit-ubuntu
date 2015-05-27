#!/bin/sh

sa_passwd=$1

echo sudo service openfire stop >> ../uninstall.log
sudo service openfire stop 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -r openfire >> ../uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -P openfire >> ../uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a ../uninstall.log

echo 'mysql -u sa -p < openfire/conf/openfire_cleanup.sql' >> ../uninstall.log
mysql -u sa -p$sa_passwd < conf/openfire_cleanup.sql 2>&1 | tee -a ../uninstall.log
