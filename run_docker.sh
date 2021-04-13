#!/usr/bin/env bash


set -e

mkdir -p wheels
rm -f wheels/*.whl
# docker run -v /wheels:/vol --rm --entrypoint bash "$DOCKERHUB_USERNAME"/kwiver_py37:latest -c 'cp --preserve=timestamps /kwiver/python/dist/*.whl /vol/. && chown '`id -u`':'`id -g`' /vol/*.whl'
imname=$(docker create "$DOCKERHUB_USERNAME"/kwiver_py37)
docker cp $imname:/kwiver/python/dist/ wheels
mkdir pages
cp --preserve=timestamps -r wheels/dist/ pages/
python3 mkpypa.py