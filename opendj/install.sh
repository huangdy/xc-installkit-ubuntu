#!/bin/sh

echo Install OpenDJ
echo sudo unzip -d /opt OpenDJ-2.7.0-20131023.zip >> ../install.log
sudo unzip -d /opt OpenDJ-2.7.0-20131023.zip 2>&1 | tee -a ../install.log

read -p "Enter the password for OpenDJ's admin: " opendj_admin_passwd
read -p "Enter the password for Core User: admin: " admin_passwd
read -p "Enter the password for Core User: xchangecore: " xc_passwd

echo Setup OpenDJ
echo sudo /opt/opendj/setup --cli --no-prompt --doNotStart -Z 636 -q --generateSelfSignedCertificate -N XCHANGECORE --adminConnectorPort 4444 -D "cn=Directory Manager" -w $opendj_admin_passwd -b dc=xchangecore,dc=us -a >> ../install.log
sudo /opt/opendj/setup --cli --no-prompt --doNotStart -Z 636 -q --generateSelfSignedCertificate -N XCHANGECORE --adminConnectorPort 4444 -D "cn=Directory Manager" -w $opendj_admin_passwd -b dc=xchangecore,dc=us -a 2>&1 | tee -a ../install.log

echo Starting OpenDJ
echo sudo /opt/opendj/bin/start-ds >> ../install.log
sudo /opt/opendj/bin/start-ds 2>&1 | tee -a ../install.log

echo Creating Admin and User Groups
echo cp conf/setup.ldif.orig conf/setup.ldif >> ../install.log
cp conf/setup.ldif.orig conf/setup.ldif 2>&1 | tee -a ../install.log

echo Replace all the replacements
echo rpl "%ADMINUSER%" admin conf/setup.ldif >> ../install.log
rpl "%ADMINUSER%" admin conf/setup.ldif 2>&1 | tee -a ../install.log
echo rpl "%ADMINPASS%" $admin_passwd conf/setup.ldif >> ../install.log
rpl "%ADMINPASS%" $admin_passwd conf/setup.ldif 2>&1 | tee -a ../install.log
echo rpl "%COREUSER%" xchangecore conf/setup.ldif >> ../install.log
rpl "%COREUSER%" xchangecore conf/setup.ldif 2>&1 | tee -a ../install.log
echo rpl "%COREPASS%" $xc_passwd conf/setup.ldif >> ../install.log
rpl "%COREPASS%" $xc_passwd conf/setup.ldif 2>&1 | tee -a ../install.log

echo modify the ldap using setup.ldif
echo sudo /opt/opendj/bin/ldapmodify -p 636 -D "cn=Directory Manager" -w $opendj_admin_passwd -X -Z --noPropertiesFile -a -f conf/setup.ldif >> ../install.log
sudo /opt/opendj/bin/ldapmodify -p 636 -D "cn=Directory Manager" -w $opendj_admin_passwd -X -Z --noPropertiesFile -a -f conf/setup.ldif 2>&1 | tee -a ../install.log

echo removed the setup.ldif
echo rm conf/setup.ldif >> ../install.log
rm conf/setup.ldif 2>&1 | tee -a ../install.log

echo replace SYSADMINPASS, COREUSER, COREPASS, FQDN in xchangecore/core.properties
echo rpl "%SYSADMINPASS%" $opendj_admin_passwd ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
rpl "%SYSADMINPASS%" $opendj_admin_passwd ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
echo rpl "%COREUSER%" xchangecore ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
rpl "%COREUSER%" xchangecore ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
echo rpl "%COREPASS%" $xc_passwd ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
rpl "%COREPASS%" $xc_passwd ../xchangecore/xchangecore/core.properties 2>&1 | tee -a ../install.log
