#! /bin/bash

set -e


psql v ON_ERROR_STOP=1 -U "$POSTGRES_GIS_USER" -d "$POSTGRES_GIS_DATABASE" <<-EOSQL
CREATE EXTENSION fuzzystrmatch;
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_tiger_geocoder;
--this one is optional if you want to use the rules based standardizer (pagc_normalize_address)
CREATE EXTENSION address_standardizer;

INSERT INTO tiger.loader_platform(
  os,
  declare_sect,
  pgbin,
  wget,
  unzip_command,
  psql,
  path_sep,
  loader,
  environ_set_command,
  county_process_command
)
SELECT 'geocoder',
  declare_sect,
  pgbin,
  wget,
  unzip_command,
  psql,
  path_sep,
  loader,
  environ_set_command,
  county_process_command
FROM tiger.loader_platform
WHERE os = 'sh';


UPDATE tiger.loader_platform 
SET declare_sect = 'TMPDIR="/gisdata/temp/"
 UNZIPTOOL=unzip
 WGETTOOL="/usr/bin/wget"
 export PGBIN=/usr/lib/postgresql/12/bin
 export PGPORT=5432
 export PGHOST=localhost
 export PGUSER=${POSTGRES_USER}
 export PGPASSWORD=${POSTGRES_PASS}
 export PGDATABASE=geocoder
 PSQL=psql
 SHP2PGSQL=shp2pgsql
 cd /gisdata
'
WHERE os = 'geocoder';

SELECT declare_sect
FROM tiger.loader_platform
WHERE os = 'geocoder';

EOSQL
