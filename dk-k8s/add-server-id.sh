##  tododb/add-server-id.sh
#! /bin/bash -e
OCTETS={`hostname -i | tr -s '.' ' '`}

MYSQL_SERVER_IO=``
echo "" >> /etc/mysql/mysql.conf.d/mysql.cnf






