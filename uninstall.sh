#!/bin/sh

echo ... uninstall the xChangeCore installation ... >> uninstall.log

echo sudo /usr/lib/apache-tomcat-7.0.57/bin/shutdown.sh >> uninstall.log
sudo /usr/lib/apache-tomcat-7.0.57/bin/shutdown.sh 2>&1 | tee -a uninstall.log

echo sudo rm -fr /usr/lib/apache-tomcat-7.0.57 >> uninstall.log
sudo rm -fr /usr/lib/apache-tomcat-7.0.57 2>&1 | tee -a uninstall.log

echo sudo service openfire stop >> uninstall.log
sudo service openfire stop 2>&1 | tee -a uninstall.log

echo sudo dpkg -r openfire >> uninstall.log
sudo dpkg -r openfire 2>&1 | tee -a uninstall.log

echo sudo dpkg -P openfire >> uninstall.log
sudo dpkg -P openfire 2>&1 | tee -a uninstall.log

echo mysql -u root -p < openfire/conf/openfire_cleanup.sql >> uninstall.log
mysql -u root -p < openfire/conf/openfire_cleanup.sql 2>&1 | tee -a uninstall.log

echo sudo /opt/opendj/bin/stop-ds >> uninstall.log
sudo /opt/opendj/bin/stop-ds 2>&1 | tee -a uninstall.log

echo sudo rm -fr /opt/opendj >> uninstall.log
sudo rm -fr /opt/opendj 2>&1 | tee -a uninstall.log
