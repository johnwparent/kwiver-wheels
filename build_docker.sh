#!/usr/bin/env bash


set -e


docker pull quay.io/pypa/manylinux2014_x86_64:latest
docker images
mkdir -p wheels
rm -f wheels/*.whl
docker build --force-rm -t kwiver:wheel --output type=local,dest=wheels -f Dockerfile.wheel .

mkdir pages
cp --preserve=timestamps wheels/*.whl pages/.
python3 mkpypa.py