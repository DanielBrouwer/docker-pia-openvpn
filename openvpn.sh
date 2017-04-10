#!/bin/sh
set -e -u -o pipefail

set -- "$@" '--config' "${REGION:-US East}.ovpn"

if [ ! -f auth.conf ]; then
  echo "${USERNAME:-NONE PROVIDED}" > auth.conf
  echo "${PASSWORD:-NONE PROVIDED}" >> auth.conf
  chmod 600 auth.conf
fi

set -- "$@" '--auth-user-pass' 'auth.conf'

openvpn "$@"
