#! /bin/bash

set -e

# Database actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"


# https://pgtune.leopard.in.ua
# DB Version: 12
# OS Type: linux
# DB Type: mixed
# Total Memory (RAM): 8 GB
# CPUs num: 8
# Data Storage: ssd

psql -c "ALTER SYSTEM SET max_connections = '100';"
psql -c "ALTER SYSTEM SET shared_buffers = '2GB';"
psql -c "ALTER SYSTEM SET effective_cache_size = '6GB';"
psql -c "ALTER SYSTEM SET maintenance_work_mem = '512MB';"
psql -c "ALTER SYSTEM SET checkpoint_completion_target = '0.9';"
psql -c "ALTER SYSTEM SET wal_buffers = '16MB';"
psql -c "ALTER SYSTEM SET default_statistics_target = '100';"
psql -c "ALTER SYSTEM SET random_page_cost = '1.1';"
psql -c "ALTER SYSTEM SET effective_io_concurrency = '200';"
psql -c "ALTER SYSTEM SET work_mem = '2621kB';"
psql -c "ALTER SYSTEM SET min_wal_size = '1GB';"
psql -c "ALTER SYSTEM SET max_wal_size = '2GB';"
psql -c "ALTER SYSTEM SET max_worker_processes = '8';"
psql -c "ALTER SYSTEM SET max_parallel_workers_per_gather = '4';"
psql -c "ALTER SYSTEM SET max_parallel_workers = '8';"
