#!/usr/bin/env bash

set -e

cuda16="nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04"
cuda18="nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04"

arch="$(echo "$BASE_IMAGE" | sed 's/://g')"

if [ $CUDA == "ON" ]; then
    if [[ $cuda16 =~ "$arch" ]]; then
        from_image=$cuda16
    else
        from_image=$cuda18
    fi
    from="-cuda10.0-cudnn7-devel"
else
    from_image=$BASE_IMAGE
    from=""
fi

export from_image
export from
