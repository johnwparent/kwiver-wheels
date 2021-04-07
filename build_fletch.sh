#!/usr/bin/env bash

if [ -f "$FILE" ]; then
    # docker load image from stored cache
    docker load -q < $FILE
else
    # docker generate from scratch
    docker build --force-rm -t fletch_py -f Dockerfile.fletch .
fi