#!/bin/bash

docker stop clickhouse-01
docker stop vector-01

docker rm clickhouse-01
docker rm vector-01