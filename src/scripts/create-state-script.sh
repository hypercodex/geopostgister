#! /bin/bash


# Select out postgis tiger geocoder nation loader script to scripts mount in container

set -e

source scripts/util/db.sh

STATE=$1
STATE_LOWER=$(echo $STATE | awk '{print tolower($0)}')

LOADER_SCRIPT="postgis/loader-scripts/${STATE_LOWER}-loader.sh"

if [ -f $LOADER_SCRIPT ]; then
  echo "removing existing $LOADER_SCRIPT"
  rm $LOADER_SCRIPT
fi

run_sql_to_file "SELECT Loader_Generate_Script(ARRAY['$STATE'], 'geocoder');" $LOADER_SCRIPT

echo "New state loader script located at [$LOADER_SCRIPT]"
