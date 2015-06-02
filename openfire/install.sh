#!/bin/sh

sa_passwd=$1
au_passwd=$2
cu_passwd=$3

echo INSTALL:  Openfire 2>&1 | tee -a ../install.log
echo sudo dpkg -i openfire_3.7.1_all.deb 2>&1 | tee -a ../install.log
sudo dpkg -i openfire_3.7.1_all.deb 2>&1 | tee -a ../install.log

read -p "Enter the XMPP's FQDN: " fqdn

echo create tables for OpenFire 2>&1 | tee -a ../install.log
echo cp conf/openfire_mysql.sql.orig conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
cp conf/openfire_mysql.sql.orig conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%SYSADMINPASS%" "$sa_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%SYSADMINPASS%" "$sa_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%ADMINPASS%" "$au_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%ADMINPASS%" "$au_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%FQDN%" "$fqdn" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%FQDN%" "$fqdn" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log

echo "mysql -u root -p < conf/openfire_mysql.sql" 2>&1 | tee -a ../install.log
mysql -u root -p < conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rm conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rm conf/openfire_mysql.sql 2>&1 | tee -a ../install.log

echo configure the conf/openfire.xml 2>&1 | tee -a ../install.log
echo cp conf/openfire.xml.orig conf/openfire.xml 2>&1 | tee -a ../install.log
cp conf/openfire.xml.orig conf/openfire.xml 2>&1 | tee -a ../install.log
echo rpl "%SYSADMINPASS%" "$sa_passwd" conf/openfire.xml 2>&1 | tee -a ../install.log
rpl "%SYSADMINPASS%" "$sa_passwd" conf/openfire.xml 2>&1 | tee -a ../install.log
echo sudo cp /etc/openfire/openfire.xml /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
sudo cp /etc/openfire/openfire.xml /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
echo sudo chown openfire:openfire /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
sudo chown openfire:openfire /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
echo sudo cp conf/openfire.xml /etc/openfire 2>&1 | tee -a ../install.log
sudo cp conf/openfire.xml /etc/openfire 2>&1 | tee -a ../install.log
echo rm conf/openfire.xml 2>&1 | tee -a ../install.log
rm conf/openfire.xml 2>&1 | tee -a ../install.log

echo Generating self-signed keys for Openfire 2>&1 | tee -a ../install.log
echo cp /etc/openfire/security/keystore security 2>&1 | tee -a ../install.log
cp /etc/openfire/security/keystore security 2>&1 ../install.log

echo cp installKeystore.orig installKeystore 2>&1 | tee -a ../install.log
cp installKeystore.orig installKeystore 2>&1 | tee -a ../install.log
echo rpl "%HOSTNAME%" "$fqdn" installKeystore 2>&1 | tee -a ../install.log
rpl "%HOSTNAME%" "$fqdn" installKeystore 2>&1 | tee -a ../install.log
echo rpl "%KEYSTORE_PASS%" "$sa_passwd" installKeystore 2>&1 | tee -a ../install.log
rpl "%KEYSTORE_PASS%" "$sa_passwd" installKeystore 2>&1 | tee -a ../install.log

echo Generate the keystore and keystore.jks 2>&1 | tee -a ../install.log
./installKeystore 2>&1 | tee -a ../install.log

echo sudo cp /etc/openfire/security/keystore /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
sudo cp /etc/openfire/security/keystore /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
echo sudo cp security/keystore /etc/openfire/security 2>&1 | tee -a ../install.log
sudo cp security/keystore /etc/openfire/security 2>&1 | tee -a ../install.log
echo sudo rm security/keystore 2>&1 | tee -a ../install.log
sudo rm security/keystore 2>&1 | tee -a ../install.log
echo sudo chown openfire:openfire /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
sudo chown openfire:openfire /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
echo rm installKeystore 2>&1 | tee -a ../install.log
rm installKeystore 2>&1 | tee -a ../install.log

read -p "Enter the Java Version: like 6 or 7 or 8 or " JavaVersion

echo Replace the proper Java version for /etc/init.d/openfire
sudo rpl "6-sun" "$JavaVersion-oracle" /etc/init.d/openfire 2>&1 | tee -a ../install.log

echo Starting the OpenFire
sudo service openfire restart

echo sudo cp security/keystore.jks /etc/openfire/security 2>&1 | tee -a ../install.log
sudo cp security/keystore.jks /usr/share/tomcat7/conf 2>&1 | tee -a ../install.log

echo sudo rm security/keystore.jks 2>&1 | tee -a ../install.log
sudo rm security/keystore.jks 2>&1 | tee -a ../install.log

echo sudo rpl "%KEYSTORE_PASS%" "$sa_passwd" /usr/share/tomcat7/conf/server.xml 2>&1 | tee -a ../install.log
sudo rpl "%KEYSTORE_PASS%" "$sa_passwd" /usr/share/tomcat7/conf/server.xml 2>&1 | tee -a ../install.log

echo replace FQDN in xchangecore/core.properties
echo rpl "%FQDN%" "$fqdn" ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
rpl "%FQDN%" "$fqdn" ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log

echo sudo mv ../xchangecore/xchangecore /usr/share/tomcat7/webapps 2>&1 | tee -a ../install.log
sudo mv ../xchangecore/xchangecore /usr/share/tomcat7/webapps 2>&1 | tee -a ../install.log
echo sudo mv ../xchangecore/opendj-connector /usr/share/tomcat7/webapps 2>&1 | tee -a ../install.log
sudo mv ../xchangecore/opendj-connector /usr/share/tomcat7/webapps 2>&1 | tee -a ../install.log

echo Starting the Tomcat 2>&1 | tee -a ../install.log
sudo service tomcat7 start 2>&1 | tee -a ../install.log

echo ... done ...
