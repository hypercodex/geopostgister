### Getting the Code
Clone the repository into an appropriate location with:
```git clone https://github.com/hypercodex/geopostgister.git```


## Installing
#### Secrets
Docker compose passes secrets into the containers. For this to work generate a `.env` file
in the `src` folder using the `enviroment_template` as the template. These env variables
provide the Postgresql password and user role under which the geocoder database will run.
This env file should located at `src/.env`. Modify the environment_template.env file with 
a unique user and password combination, saving the resulting file as `src/.env`. Do not 
check this file in or share it in an unsecure manner!

### Building
After configuring the secrets, building the docker image with:
```
cd geopostgister/src
docker-compose build
```

### Running
```
docker-compose up -d
```

### Loading
```
bash load-tiger-geocoder.sh $STATE_
```
