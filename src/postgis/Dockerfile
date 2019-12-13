FROM postgres:12

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE true

ENV POSTGIS_VERSION 3
ENV TZ America/Los_Angles

# Assumes debian buster which is what postgres:12 is FROM... 
ENV POSTGRES_APT_REPO "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main"

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates unzip

RUN mkdir -p /etc/apt/sources.list.d/ && \
  touch /etc/apt/sources.list.d/pgdg.list && \
  echo ${POSTGRES_APT_REPO} > /etc/apt/sources.list.d/pgdg.list && \
  wget -q --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - 

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  postgresql-$PG_MAJOR-postgis-$POSTGIS_VERSION \
  postgresql-$PG_MAJOR-postgis-$POSTGIS_VERSION-scripts \
  postgresql-$PG_MAJOR-pgrouting \
  postgresql-$PG_MAJOR-pgrouting-scripts \
  postgis

# set time zone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# add bakcup job
RUN mkdir -p /opt/backups
COPY ./pgbackup.sh /opt/pgbackup.sh
RUN chmod +x /opt/pgbackup.sh

# add init script
RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb.d/* /docker-entrypoint-initdb.d/

# folder for tigerline data
RUN mkdir /gisdata

# create volume for backups
VOLUME ["/opt/backups"]

