#!/bin/bash
#
# install backends and storage
#

set -euo pipefail

function fetch_calendso_dist() {
    local location="$1"
    calendso_version="heads/master"
    calendso="https://github.com/calcom/cal.com/archive/refs/${calendso_version}.tar.gz"
    curl -sL $calendso | \
        tar zxvf - --strip-components 1 -C "$location"
    echo "Calendso backend installed"
}