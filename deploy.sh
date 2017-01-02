#!/bin/bash

echo deploying...

export SQ_JDBC_USER=sonar
export SQ_JDBC_PASSW=secret
export SQ_PORT_INTERN=9000
export SQ_PORT_EXTERN=9009

COMPOSE_ARGS="\
        -f docker-compose.yml \
        -p loc"

docker-compose \
        $COMPOSE_ARGS \
        build

docker-compose \
        $COMPOSE_ARGS \
        up -d