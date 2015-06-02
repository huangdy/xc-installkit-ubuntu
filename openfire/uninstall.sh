#!/bin/sh

echo sudo service openfire stop 2>&1 | tee -a ../uninstall.log
sudo service openfire stop 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -r openfire 2>&1 | tee -a ../uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -P openfire 2>&1 | tee -a ../uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a ../uninstall.log

echo remove the openfire service daemon 2>&1 | tee -a ../uninstall.log
sudo update-rc.d openfire remove 2>&1 | tee -a ../uninstall.log

echo "mysql -u root -p < conf/openfire_cleanup.sql" 2>&1 | tee -a ../uninstall.log
mysql -u root -p < conf/openfire_cleanup.sql 2>&1 | tee -a ../uninstall.log
