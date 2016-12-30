#!/bin/bash

echo deploying...

export PG_VERSION=9.5
export PG_PORT_INTERN=5432
export PG_PORT_EXTERN=5432

export SQ_VERSION=5.6
export SQ_PG_HOST=pgsonar
export SQ_PORT_INTERN=9000
export SQ_PORT_EXTERN=9000
export SQ_JDBC_USER=sonar
export SQ_JDBC_PASSW=secret
export SQ_JDBC_URL=jdbc:postgresql://$SQ_PG_HOST:$PG_PORT_EXTERN/sonar

COMPOSE_ARGS="\
        -f docker-compose.yml \
        -p loc"

docker pull sonarqube:$SQ_VERSION
docker pull postgres:$PG_VERSION

docker-compose \
        $COMPOSE_ARGS \
        build

docker-compose \
        $COMPOSE_ARGS \
        up -d