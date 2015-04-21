#!/bin/sh

echo sudo service tomcat7 stop 2>&1 | tee -a ../uninstall.log
sudo service tomcat7 stop 2>&1 | tee -a ../uninstall.log

echo sudo rm -fr /usr/share/tomcat7 2>&1 | tee -a ../uninstall.log
sudo rm -fr /usr/share/tomcat7 2>&1 | tee -a ../uninstall.log

echo sudo rm /etc/init.d/tomcat7 2>&1 | tee -a ../uninstall.log
sudo rm /etc/init.d/tomcat7 2>&1 | tee -a ../uninstall.log
