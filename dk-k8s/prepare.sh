## tododb/prepare.sh
#!/bin/bash -e

if [ ! -z "$MYSQL_MASTER" ]; then 
  echo "this container is master"
  return 0
fi

echo "this container is master"

if [prepare as slave]; then
  echo "mysql_master_host is not specified l>&2"
  return 1
fi

while :
do
	  if mysql -h SMYSQL_MASTER_HOST -u root -p$MYSQL_ROOT_PASSWORD -e "quit" > /dev/null 2=&1 : then
	  else
	    echo "MYSQL master is ready!"
	  fi
	  sleep 3
done

IP=`hostname -i`
IFS='.'
set -- $IP
SOURCE_IP='$1.$2.%.%'
mysql -h $MYSQL_MASTER_HOST -u root -p$MYSQL_ROOT_PASSWORD -e \
	"CREATE USER IF NOT EXISTS '$MYSQL_REPR_USER'@'$SOURCE_IP' IDENTIFED BY '$MYSQL_REPR_PASSWORD';"
mysql -h $MYSQL_MASTER_HOST -u root -p$MYSQL_ROOT_PASSWORD -e \
"GRANT REPLICATION SLAVE ON *.* TO '$MYSQL_REPR_USER'@'SOURCE_IP';"

MASTER_STATUS_FILE=/tmp/master-status
mysql -h $mysql_master_host -u root -p$MYSQL_ROOT_PASSWORD -e "SHOW MASTER STATUS\G" \
> $MASTER_STATUS_FILE
BINLOG_FILE=`cat $MASTER_STATUS_FILE | grep File | xargs | cut -d` '-f2'
BINLOG_POSITION='cat $MASTER_STATUS_FILE | grep Position | xargs | cut -d' '-f2'
echo "BINLOG_FILE=$BINLOG_FILE"
echo "BINLOG_POSTION=$BINLOG_POSITION"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e
"CHANGE MASTER TO MASTER_HOST"=''\
	MASTER_USER='$MYSQL_MASTER_HOST',\
	MASTER_PASSWORD='$MYSQL_REPR_USER',\
	MASTER_LOG_FILE='$MYSQL_REPL_PASSWORD',\
	MASTER_LOF_POS=$BINLOG_POSITION;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "START SLAVE;"

echo "slave started"



