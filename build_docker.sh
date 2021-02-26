#!/usr/bin/env bash


set -e


docker pull quay.io/pypa/manylinux2014_x86_64:latest
docker images
mkdir -p wheels
rm -f wheels/*.whl
docker build --force-rm -t kwiver/wheels -f Dockerfile.wheel .
docker run -v $PWD/wheels:/vol --rm --entrypoint bash kwiver/wheels:latest -c 'cp --preserve=timestamps /kwiver/python/dist/*.whl /vol/. && chown '`id -u`':'`id -g`' /vol/*.whl'
mkdir pages
cp --preserve=timestamps wheels/*.whl pages/.
python3 mkpypa.py