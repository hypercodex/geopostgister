#! /bin/bash

set -e

source .env

function run_sql {
  # args $1: sql statement
  psql -d ${POSTGRES_GIS_DATABASE} -U ${POSTGRES_GIS_USER} -p 5433 -h localhost -c "$1" 
}

function run_sql_to_file {
  # args $1: sql statement
  #      $2: outfile
  psql -d ${POSTGRES_GIS_DATABASE} -U ${POSTGRES_GIS_USER} -p 5433 -h localhost -c "$1" -tA > $2
}

