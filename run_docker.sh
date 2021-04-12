#!/usr/bin/env bash


set -e

mkdir -p wheels
rm -f wheels/*.whl
docker run -v /wheels:/vol --rm --entrypoint bash "$DOCKERHUB_USERNAME"/kwiver_py37:latest -c 'cp --preserve=timestamps /kwiver/python/dist/*.whl /vol/. && chown '`id -u`':'`id -g`' /vol/*.whl'
mkdir pages
cp --preserve=timestamps wheels/*.whl pages/.
python3 mkpypa.py