#!/bin/bash

host=$1
port=$2
user=$3
pass=$4
ssl=$5

if [ -z $host ] && [ -z $port ] && [ -z $user ] && [ -z $pass ]
then
  mariadb="mariadb"
elif [ -z $ssl ]
then
  mariadb="mariadb --host ${host} --port ${port} --user ${user} -p${pass}"
else
  mariadb="mariadb --host ${host} --port ${port} --user ${user} -p${pass} --ssl-ca ${ssl}"
fi

# Create shipping database with tracking information
echo "Creating schema..."
${mariadb} < schema.sql
echo "Schema created."

echo "Loading data..."

# Load tracking into shipping.tracking

for f in `ls ./data/*.csv`
do
	time ${mariadb} shipping -e "LOAD DATA LOCAL INFILE '$f'
  INTO TABLE tracking
  FIELDS TERMINATED BY ','
  OPTIONALLY ENCLOSED BY '\"'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
    (@date_time,
    type,
    mmsi,
    latitude,
    longitude,
    status,
    rot,
    sog,
    cog,
    heading,
    imo,
    callsign,
    name,
    shiptype,
    cargotype,
    shipwidth,
    shiplength,
    shipdevice,
    shipdraught,
    destination,
    eta,
    sourcetype,
    A,
    B,
    C,
    D)
  SET ts = DATE_FORMAT(STR_TO_DATE(@date_time, '%d/%m/%Y %H:%i:%s'), '%Y-%m-%d %H:%i:%s');
  "
	echo " - $f loaded into shipping.traffic"
done

echo "Done!"
