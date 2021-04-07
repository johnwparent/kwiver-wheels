#!/usr/bin/env bash
FILE="fpyi_docker.tar"
if [ -f "$FILE" ]; then
    # docker load image from stored cache
    docker load -q < $FILE
else
    # docker generate from scratch
    docker build --force-rm -t fletch_py37 -f Dockerfile.fletch .
fi