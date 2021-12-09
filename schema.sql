
DROP DATABASE IF EXISTS shipping;
CREATE DATABASE shipping;

USE shipping

CREATE TABLE tracking (
	ts DATETIME,
	type VARCHAR(20),
	mmsi VARCHAR(12),
	latitude DECIMAL(9,5),
	longitude DECIMAL(9,5),
	status VARCHAR(100),
	rot DECIMAL(5,2),
	sog DECIMAL(5,2),
	cog DECIMAL(5,2),
	heading SMALLINT,
	imo VARCHAR(255),
	callsign VARCHAR(10),
	name VARCHAR(255),
	shiptype VARCHAR(255),
	cargotype VARCHAR(255),
	shipwidth DECIMAL(6,2),
	shiplength DECIMAL(8,2),
	shipdevice VARCHAR(255),
	shipdraught DECIMAL(5,2),
	destination VARCHAR(255),
	eta DATETIME,
	sourcetype VARCHAR(10),
	A SMALLINT,
	B SMALLINT,
	C SMALLINT,
	D SMALLINT
) engine=columnstore default character set=utf8;
