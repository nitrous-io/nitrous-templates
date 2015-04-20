#!/usr/bin/env bash

source $(dirname "$BASH_SOURCE[0]")/helper
source $(dirname "$BASH_SOURCE[0]")/test-helper

docker_run_opts() {
  echo "-p 2222:22"
}

container_test() {
  info "Check patches for http://www.ubuntu.com/usn/usn-2537-1/"
  if ! apt-cache show libssl1.0.0 | grep "Version: 1.0.1f-1ubuntu2.11" ; then
    error "libssl1.0.0 is wrong version"
    exit 1
  fi
}

case "$1" in 
'docker_run_opts' | 'container_test') $1 ;;
esac
