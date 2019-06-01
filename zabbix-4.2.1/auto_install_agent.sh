#!/bin/bash

set -eo pipefail
shopt -s nullglob

file_dir=`dirname $0`
if [ $file_dir -eq '.' ]
then
    file_dir=`pwd`
fi
cd $file_dir

if [ -d /usr/local/zabbix-4.2.1/ ]
then
    echo "zabbix has been installed."
else
    tar -xvf zabbix-4.2.1.tar.gz
    cd zabbix-4.2.1
    ./configure --prefix=/usr/local/zabbix-4.2.1/ --enable-agent && make && make install
    cd /usr/local/
    ln -s /usr/local/zabbix-4.2.1 zabbix
fi