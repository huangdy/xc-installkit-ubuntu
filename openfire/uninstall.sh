#!/bin/sh

echo sudo service openfire stop >> ../uninstall.log
sudo service openfire stop 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -r openfire >> ../uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a ../uninstall.log

echo sudo dpkg -P openfire >> ../uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a ../uninstall.log

echo 'mysql -u sa -p < openfire/conf/openfire_cleanup.sql' >> ../uninstall.log
echo 'Enter MySQL sa password: '
mysql -u sa -p < conf/openfire_cleanup.sql 2>&1 | tee -a ../uninstall.log
