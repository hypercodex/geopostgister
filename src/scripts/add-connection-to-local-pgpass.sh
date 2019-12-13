#! /bin/bash


# Adds a connection to local pgpass for geocoder db using the values from the docker .env file
# these values from the .env file correspond to the database 

set -m

source .env && echo "localhost:5433:geocoder:${POSTGRES_GIS_USER}:${POSTGRES_GIS_USER_PASSWORD}" >> ~/.pgpass

chmod 600 ~/.pgpass
