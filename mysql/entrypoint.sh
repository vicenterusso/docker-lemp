#!/bin/bash
chown mysql:mysql /etc/mysql/conf.d/docker.cnf
chown mysql:mysql /etc/mysql/mysql.conf.d/mysqld.cnf
chmod 777 /etc/mysql/conf.d/docker.cnf
chmod 777 /etc/mysql/mysql.conf.d/mysqld.cnf
#644