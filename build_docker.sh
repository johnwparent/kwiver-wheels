#!/usr/bin/env bash


set -e


docker pull quay.io/pypa/manylinux2014_x86_64:latest
docker images

docker build . -t KWIVER_WHEEL_TEST