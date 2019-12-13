#! /bin/bash


# Select out postgis tiger geocoder nation loader script to scripts mount in container

set -e

source scripts/util/db.sh

LOADER_SCRIPT=postgis/loader-scripts/nation-script-load.sh

if [ -f $LOADER_SCRIPT ]; then
  echo "removing existing $LOADER_SCRIPT"
  rm $LOADER_SCRIPT
fi

run_sql_to_file "SELECT loader_generate_nation_script('geocoder');" $LOADER_SCRIPT 


echo "New nation loader script located at [$LOADER_SCRIPT]"
