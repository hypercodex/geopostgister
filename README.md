# Dockerized Postgreql PostGIS Geocoding Serivce

### Requirements:
#### Docker service
  - Docker Engine
#### Optional: Postgresql client on host
  - For Debian variants install a client with:

```
sudo apt install postgresql-client
```

  - For macOS postgresql.app can be a good option: https://postgresapp.com

### Installing/Bootstrapping the Service
See [install guide.](INSTALL.md "Installing - Geopostgister")

#### Load State Tiger Line Data
After making sure the requirements are correctly installed.

Run the bootstrapping loader for $STATE

```
bash load-tiger-geocoder.sh
```

The loading step can take a long time depending on network connection speed. The tiger data 
is stored in a docker volume mount that is persistant as long as the docker engine maintains
the volume.

