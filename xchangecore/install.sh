#!/bin/sh

basedir=`pwd`

read -p "Enter lat/lon for core's proximity: (Enter for skip) " location

echo mkdir xchangecore && cd xchangecore && jar xvf ../xchangecore-2.0.0.war 2>&1 | tee -a ../../install.log
mkdir xchangecore && cd xchangecore && jar xvf ../xchangecore-2.0.0.war 2>&1 | tee -a ../../install.log

rpl -q "%LOCATION%" "$location" core.properties

echo mysql -u root -p < conf/xchangecore_creation.sql 2>&1 | tee -a ../install.log
echo 'Enter MySQL root password: '
mysql -u root -p < conf/xchangecore_creation.sql 2>&1 | tee -a ../install.log

cd $basedir
echo tar xvf opendj-connector.war 2>&1 | tee -a ../install.log
tar xvf opendj-connector.war 2>&1 | tee -a ../install.log
