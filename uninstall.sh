#!/bin/sh

echo ... uninstall the xChangeCore installation ... >> uninstall.log

read -p "Enter the System Administrator's Password: " sa_passwd

echo uninstall -- tomcat --
cd tomcat && ./uninstall.sh && cd -

echo uninstall -- xchangecore --
cd xchangecore && ./uninstall.sh $sa_passwd && cd -

echo unstall -- openfire --
cd openfire && ./uninstall.sh $sa_passwd && cd -

echo uninstall -- opendj --
cd opendj && ./uninstall.sh && cd -
