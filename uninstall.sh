#!/bin/sh

echo ... uninstall the xChangeCore installation ... >> uninstall.log

echo sudo service tomcat7 stop >> uninstall.log
sudo service tomcat7 stop 2>&1 | tee -a uninstall.log

echo sudo rm -fr /usr/share/tomcat7 >> uninstall.log
sudo rm -fr /usr/share/tomcat7 2>&1 | tee -a uninstall.log

echo sudo rm /etc/init.d/tomcat7 >> uninstall.log
sudo rm /etc/init.d/tomcat7 2>&1 | tee -a uninstall.log

echo sudo service openfire stop >> uninstall.log
sudo service openfire stop 2>&1 | tee -a uninstall.log

echo sudo dpkg -r openfire >> uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a uninstall.log

echo sudo dpkg -P openfire >> uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a uninstall.log

echo 'mysql -u root -p < openfire/conf/openfire_cleanup.sql' >> uninstall.log
echo 'Enter MySQL root password: '
mysql -u root -p < openfire/conf/openfire_cleanup.sql 2>&1 | tee -a uninstall.log

echo sudo /opt/opendj/bin/stop-ds >> uninstall.log
sudo /opt/opendj/bin/stop-ds 2>&1 | tee -a uninstall.log

echo sudo rm -fr /opt/opendj >> uninstall.log
sudo rm -fr /opt/opendj 2>&1 | tee -a uninstall.log
