#!/usr/bin/env bash
usage() {
    cat <<EOM
Usage:
  ./$(basename "$0") url

  url           - sopcast stream url
EOM
}

if [[ "$#" -ne 1 ]]; then
  usage
  exit 1
fi

url=$1
player_port=8902
sopcast_port=8901

/app/sp-auth/sp-sc-auth "$url" "$sopcast_port" "$player_port"
