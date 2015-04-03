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

container_test() {
  redis-cli info >/dev/null
  sleep 0.5 # give mysql time to start
  mysql -h localhost -u nitrous -e "SELECT 1" laravel >/dev/null
}

host_test() {
  curl_with_retry localhost:$pvport
}

case "$1" in 
'docker_run_opts' | 'container_setup' | 'container_test' | 'host_test') $1 ;;
esac
