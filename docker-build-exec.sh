#!/bin/sh

set -e

# build the docker image
IMAGE=$(docker build -q .)
# start a detached container
CONTAINER=$(docker run -e POSTGRES_PASSWORD=g -d $IMAGE)
# attach psql to it
docker exec -it -u postgres $CONTAINER bash -c "until pg_isready -q; do sleep 1; done; psql"
# delete the container
docker rm -f $CONTAINER
