#!/usr/bin/env bash

mysql -uroot "CREATE USER 'osl'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot "GRANT ALL PRIVILEGES ON * . * TO 'osl'@'localhost';"
mysql -uroot "FLUSH PRIVILEGES;"
