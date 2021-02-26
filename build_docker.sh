#!/usr/bin/env bash


set -e


docker pull quay.io/pypa/manylinux2014_x86_64:latest
docker images

docker build --force-rm -t kwiver:wheel .
mkdir -p wheels
rm -f wheels/*.whl
docker run kwiver:wheel
mkdir pages
# cp --preserve=timestamps wheels/*.whl pages/.
