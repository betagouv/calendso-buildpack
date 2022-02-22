#!/bin/bash
#
# install backends and storage
#

set -euo pipefail

echo "# $(basename $0)"

calendso_version="heads/master"
calendso="https://github.com/calcom/cal.com/archive/refs/${calendso_version}.tar.gz"
calendso_dir="calendso"
mkdir errbackends
( cd errbackends  ;
  mkdir $calendso_dir
  curl -sL $calendso | \
    tar zxvf - --strip-components 1 -C $calendso_dir
)

echo "Calendso backend installed"