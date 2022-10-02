#!/bin/bash

sudo sed -i 's/\/etc\/postgresql\/12\/main\/pg_hba.conf/\/home\/codeally\/project\/.freeCodeCamp\/pg_hba.conf/' /etc/postgresql/12/main/postgresql.conf

sudo service postgresql restart

psql --username=freecodecamp dbname=postgres
