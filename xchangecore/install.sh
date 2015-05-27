#!/bin/sh

sa_passwd=$1
au_passwd=$2
cu_passwd=$3
lat=$4
lon=$5
lat_lon=


if [ -n "$lat" ] && [ -n "$lon" ]; then
	lat_lon=$lat/$lon
fi

basedir=`pwd`

echo mkdir xchangecore && cd xchangecore && jar xvf ../xchangecore-2.0.0.war 2>&1 | tee -a ../../install.log
mkdir xchangecore && cd xchangecore && jar xvf ../xchangecore-2.0.0.war 2>&1 | tee -a ../../install.log

cd $basedir
echo rpl -q "%LOCATION%" "$lat_lon" xchangecore/core.properties 2>&1 | tee -a ../../install.log
rpl -q "%LOCATION%" "$lat_lon" xchangecore/core.properties 2>&1 | tee -a ../../install.log

echo mysql -u sa -p < conf/xchangecore_creation.sql 2>&1 | tee -a ../install.log
mysql -u sa -p$sa_passwd < conf/xchangecore_creation.sql 2>&1 | tee -a ../install.log

echo tar xvf opendj-connector.war 2>&1 | tee -a ../install.log
tar xvf opendj-connector.war 2>&1 | tee -a ../install.log
