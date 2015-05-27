#!/bin/sh

echo 'mysql -u sa -p < conf/xchangecore_cleanup.sql' >> ../uninstall.log
echo 'Enter MySQL sa password: '
mysql -u sa -p < conf/xchangecore_cleanup.sql 2>&1 | tee -a ../uninstall.log
