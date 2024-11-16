#!/usr/bin/env bash

export FVP_VERSION=${FVP_VERSION:-"11.27.19"}
export FVP_BASE_URL=${FVP_BASE_URL:-"https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.27"}
export FVP_ARCHIVE=${FVP_ARCHIVE:-"FVP_Base_RevC-2xAEMvA_11.27_19_Linux64_armv8l.tgz"}

docker build -t "fvp:${FVP_VERSION}" \
    --build-arg FVP_BASE_URL="${FVP_BASE_URL}" \
    --build-arg FVP_ARCHIVE="${FVP_ARCHIVE}" \
    --build-arg USERNAME="$(whoami)" \
    --build-arg USERID="$(id -u)" \
    "$@" . || exit

exit 0
