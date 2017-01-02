#!/bin/bash

echo deploying...

export SQ_VERSION=5.6

export SQ_JDBC_USER=sonar
export SQ_JDBC_PASSW=secret

COMPOSE_ARGS="\
        -f docker-compose.yml \
        -p loc"

docker pull sonarqube:$SQ_VERSION

docker-compose \
        $COMPOSE_ARGS \
        build

docker-compose \
        $COMPOSE_ARGS \
        up -d