#!/bin/bash
#
# install backends and storage
#

CURL="curl -L --retry 15 --retry-delay 2" # retry for up to 30 seconds

function fetch_calendso_dist() {
    local location="$1"
    calendso_version="heads/master"
    echo "Calendso backend installed"
    local dist="calendso"
    local dist_url="https://github.com/calcom/cal.com/archive/refs/${calendso_version}.tar.gz"
    if [ -f "${CACHE_DIR}/dist/${dist}" ]; then
        echo "File is already downloaded"
    else
        ${CURL} -o "${CACHE_DIR}/dist/${dist}" "${dist_url}"
    fi
    tar xzf "$CACHE_DIR/dist/${dist}" -C "$location"
}