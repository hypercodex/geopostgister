#! /bin/bash

set -e

source scripts/util/db.sh


STATE="TX"
STATE_LOWER=$(echo $STATE | awk '{print tolower($0)}')

docker-compose up -d
sleep 7


# Load nation level tigerline data
bash scripts/create-nation-script.sh
docker exec -it postgis_postgis_1 bash /usr/local/src/nation-script-load.sh

# Load state level tigerline data
bash scripts/create-state-script.sh $STATE
docker exec -it postgis_postgis_1 bash "/usr/local/src/${STATE_LOWER}-loader.sh"

run_sql "SELECT install_missing_indexes();"

docker-compose down


echo "Finished full load of nation and ${STATE} tiger line data into geocoder schema."
