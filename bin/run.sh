#!/bin/bash
set -euo pipefail

readonly ERRRUN="/app"
readonly WAIT="${WAIT:-5}"
readonly CALENDSO_TEST="${CALENDSO_TEST:-}"

ls -l

for i in data plugins errbackends; do
  [[ ! -d "${ERRRUN}/${i}" ]] && mkdir "${ERRRUN}/${i}"
done

# sleep if we need to wait for another container
if [[ -n ${WAIT} ]]; then
    echo "Sleep ${WAIT} seconds before starting calendso..."
    sleep ${WAIT}
fi

CALENDSO_PORT=${PORT:-3141}
CALENDSO_HOST=0.0.0.0

if [[ -f "${ERRRUN}/config.py" ]] ; then
    calendso_cmd="calendso -c ${ERRRUN}/config.py"
else
    calendso_cmd="calendso"
fi

# enable Webserver
echo "{'configs': {'Webserver': {'HOST': '${CALENDSO_HOST}', 'PORT': ${CALENDSO_PORT}}}}" | $calendso_cmd --storage-merge core

if [[ -n "${CALENDSO_TEST}" ]] ; then
    $calendso_cmd -T
else
    $calendso_cmd
fi

