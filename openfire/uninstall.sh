#!/bin/sh

echo sudo service openfire stop >> ../uninstall.log
sudo service openfire stop 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -r openfire >> ../uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -P openfire >> ../uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a ../uninstall.log

echo 'mysql -u root -p < openfire/conf/openfire_cleanup.sql' >> ../uninstall.log
echo 'Enter MySQL root password: '
mysql -u root -p < conf/openfire_cleanup.sql 2>&1 | tee -a ../uninstall.log
