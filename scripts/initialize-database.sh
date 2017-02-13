#!/usr/bin/env bash

CORE_PATH=$(cd $(dirname "$1") && pwd -P)/$(basename "$1")scripts
DATABASE_PATH=$CORE_PATH/initialize-database.sql

echo "******************* Setting up initial database *******************"
mysql -uroot -p < ./scripts/initialize-database.sql

echo "******************* Database setup succeeded *******************"