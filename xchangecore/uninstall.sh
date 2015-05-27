#!/bin/sh
sa_passwd=$1

echo mysql -u sa -p$sa_passwd < conf/xchangecore_cleanup.sql 2>&1 | tee -a ../uninstall.log
mysql -u sa -p$sa_passwd < conf/xchangecore_cleanup.sql 2>&1 | tee -a ../uninstall.log
