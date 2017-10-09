#!/bin/bash
set -e

#createdb -E UTF-8 -l ja_JP.UTF-8 -O redmine -T template0 redmine
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER redmine;
    CREATE DATABASE redmine;
    GRANT ALL PRIVILEGES ON DATABASE redmine TO redmine;
EOSQL

