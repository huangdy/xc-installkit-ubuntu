#!/bin/sh

echo INFO: INSTALL:  Openfire >> ../install.log >> ../install.log
echo INFO: sudo dpkg -i openfire_3.7.1_all.deb >> ../install.log
sudo dpkg -i openfire_3.7.1_all.deb 2>&1 | tee -a ../install.log

read -p "Enter the hostname: " hostname
read -p "Enter the Password for MySQL User: openfire: " mysql_openfire_passwd
read -p "Enter the Password for OpenFire User: admin: " openfire_admin_passwd 
read -p "Enter the XMPP's FQDN: " fqdn
read -p "Enter the Password for LDAP's Admin: " ldap_admin_passwd
read -p "Enter the Password for keystore: " keystore_passwd

echo INFO: create the database: dbopenfire and user: openfire >> ../install.log
echo INFO: cp conf/create_mysql.sql.orig conf/create_mysql.sql >> ../install.log
cp conf/create_mysql.sql.orig conf/create_mysql.sql 2>&1 | tee -a ../install.log
echo INFO: rpl "%OPENFIRE_MYSQL_PASS%" "$mysql_openfire_passwd" conf/create_mysql.sql >> ../install.log
rpl "%OPENFIRE_MYSQL_PASS%" "$mysql_openfire_passwd" conf/create_mysql.sql 2>&1 | tee -a ../install.log
echo INFO: "mysql -u root -p < conf/create_mysql.sql" >> ../install.log
echo "Enter MySQL root Password: "
mysql -u root -p < conf/create_mysql.sql
echo INFO: rm conf/create_mysql.sql >> ../install.log
rm conf/create_mysql.sql 2>&1 | tee -a ../install.log

echo INFO: create tables for OpenFire >> ../install.log
echo INFO: cp conf/openfire_mysql.sql.orig conf/openfire_mysql.sql >> ../install.log
cp conf/openfire_mysql.sql.orig conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo INFO: rpl "%OPENFIRE_ADMIN_PASS%" "$openfire_admin_passwd" conf/openfire_mysql.sql >> ../install.log
rpl "%OPENFIRE_ADMIN_PASS%" "$openfire_admin_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%LDAP_ADMIN_PASS%" "$ldap_admin_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%LDAP_ADMIN_PASS%" "$ldap_admin_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%FQDN%" "$fqdn" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%FQDN%" "$fqdn" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo rpl "%KEYSTORE_PASS%" "$keystore_pass" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
rpl "%KEYSTORE_PASS%" "$keystore_passwd" conf/openfire_mysql.sql 2>&1 | tee -a ../install.log
echo INFO: "mysql -u root -p < conf/openfire_mysql.sql" >> ../install.log
echo "Enter MySQL root Password: "
mysql -u root -p < conf/openfire_mysql.sql
echo INFO: rm conf/openfire_mysql.sql >> ../install.log
rm conf/openfire_mysql.sql 2>&1 | tee -a ../install.log

echo INFO: configure the conf/openfire.xml >> ../install.log
echo INFO: cp conf/openfire.xml.orig conf/openfire.xml >> ../install.log
cp conf/openfire.xml.orig conf/openfire.xml 2>&1 | tee -a ../install.log
echo INFO: rpl "%OPENFIRE_MYSQL_PASS%" "$mysql_openfire_passwd" conf/openfire.xml >> ../install.log
rpl "%OPENFIRE_MYSQL_PASS%" "$mysql_openfire_passwd" conf/openfire.xml 2>&1 | tee -a ../install.log
echo INFO: sudo cp /etc/openfire/openfire.xml /etc/openfire/openfire.xml.orig >> ../install.log
sudo cp /etc/openfire/openfire.xml /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
echo INFO: sudo chown openfire:openfire /etc/openfire/openfire.xml.orig >> ../install.log
sudo chown openfire:openfire /etc/openfire/openfire.xml.orig 2>&1 | tee -a ../install.log
echo INFO: sudo cp conf/openfire.xml /etc/openfire >> ../install.log
sudo cp conf/openfire.xml /etc/openfire 2>&1 | tee -a ../install.log
echo INFO: rm conf/openfire.xml >> ../install.log
rm conf/openfire.xml 2>&1 | tee -a ../install.log

echo INFO: Generating self-signed keys for Openfire >> ../install.log
echo cp /etc/openfire/security/keystore security >> ../install.log
cp /etc/openfire/security/keystore security 2>&1 ../install.log

echo INFO: cp installKeystore.orig installKeystore >> ../install.log
cp installKeystore.orig installKeystore 2>&1 | tee -a ../install.log
echo INFO: rpl "%HOSTNAME%" "$hostname" installKeystore >> ../install.log
rpl "%HOSTNAME%" "$hostname" installKeystore 2>&1 | tee -a ../install.log
echo INFO: rpl "%KEYSTORE_PASS%" "$keystore_passwd" installKeystore >> ../install.log
rpl "%KEYSTORE_PASS%" "$keystore_passwd" installKeystore 2>&1 | tee -a ../install.log

echo INFO: Generate the keystore and keystore.jks >> ../install.log
./installKeystore 2>&1 | tee -a ../install.log

echo INFO: sudo cp /etc/openfire/security/keystore /etc/openfire/security/keystore.orig >> ../install.log
sudo cp /etc/openfire/security/keystore /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
echo INFO: sudo cp security/keystore /etc/openfire/security >> ../install.log
sudo cp security/keystore /etc/openfire/security 2>&1 | tee -a ../install.log
echo INFO: sudo rm security/keystore >> ../install.log
sudo rm security/keystore 2>&1 | tee -a ../install.log
echo INFO: sudo chown openfire:openfire /etc/openfire/security/keystore.orig >> ../install.log
sudo chown openfire:openfire /etc/openfire/security/keystore.orig 2>&1 | tee -a ../install.log
echo INFO: rm installKeystore >> ../install.log
rm installKeystore 2>&1 | tee -a ../install.log

read -p "Enter the Java Version: like 6 or 7 or 8 or " JavaVersion

echo INFO: Replace the proper Java version for /etc/init.d/openfire
sudo rpl "6-sun" "$JavaVersion-oracle" /etc/init.d/openfire 2>&1 | tee -a ../install.log

echo INFO: Starting the OpenFire
sudo service openfire restart

echo INFO: sudo cp security/keystore.jks /etc/openfire/security >> ../install.log
sudo cp security/keystore.jks /usr/share/tomcat7/conf 2>&1 | tee -a ../install.log

echo INFO: sudo rm security/keystore.jks >> ../install.log
sudo rm security/keystore.jks 2>&1 | tee -a ../install.log

echo INFO: Starting the Tomcat >> ../install.log
sudo service tomcat7 start 2>&1 | tee -a ../install.log

echo INFO: ... done ...
