#!/bin/sh

echo install tomcat7 >> ../install.log
sudo tar -C /usr/share -zxvf apache-tomcat-7.0.57.tar.gz 2>&1 | tee -a ../install.log

echo sudo mv /usr/share/apache-tomcat-7.0.57 /usr/share/tomcat7 >> ../install.log
sudo mv /usr/share/apache-tomcat-7.0.57 /usr/share/tomcat7 2>&1 | tee -a ../install.log

echo sudo cp conf/etc.init_d.tomcat7 /etc/init.d/tomcat7 >> ../install.log
sudo cp conf/etc.init_d.tomcat7 /etc/init.d/tomcat7 2>&1 | tee -a ../install.log

echo sudo update-rc.d tomcat8 defaults >> ../install.log
sudo update-rc.d tomcat7 defaults 2>&1 | tee -a ../install.log

echo sudo cp /usr/share/tomcat7/conf/server.xml /usr/share/tomcat7/conf/server.xml.orig >> ../install.log
sudo cp /usr/share/tomcat7/conf/server.xml /usr/share/tomcat7/conf/server.xml.orig 2>&1 | tee -a ../install.log

echo sudo cp /usr/share/tomcat7/conf/tomcat-users.xml /usr/share/tomcat7/conf/tomcat-users.xml >> ../install.log
sudo cp /usr/share/tomcat7/conf/tomcat-users.xml /usr/share/tomcat7/conf/tomcat-users.xml.orig 2>&1 | tee -a ../install.log

echo sudo cp conf/server.xml /usr/share/tomcat7/conf >> ../install.log
sudo cp conf/server.xml /usr/share/tomcat7/conf 2>&1 | tee -a ../install.log
