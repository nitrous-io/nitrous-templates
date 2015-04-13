#!/usr/bin/env bash

source $(dirname "$BASH_SOURCE[0]")/helper
source $(dirname "$BASH_SOURCE[0]")/test-helper

pvport=3000

docker_run_opts() {
  echo "-p $pvport:$pvport"
}

container_setup() {
  /home/nitrous/code/example/start-app
}

host_test() {
  curl_with_retry localhost:$pvport
}

case "$1" in 
'docker_run_opts' | 'container_setup' | 'host_test') $1 ;;
esac
