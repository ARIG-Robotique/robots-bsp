#!/usr/bin/env bash

echo "Build docker image"
docker build --build-arg "host_uid=$(id -u)" --build-arg "host_gid=$(id -g)" --tag arig-yocto-build:latest .

docker run --rm -it -v $(pwd)/build:/home/yocto-build/build \
  --device=/dev/net/tun:/dev/net/tun --device=/dev/kvm:/dev/kvm \
  --cap-add NET_ADMIN \
  arig-yocto-build:latest "${@}"
