#!/bin/sh

set -ex

su -c 'while [[ true ]]; do if [[ $(ps -a | grep aws | wc -l) -eq 0 ]]; then sleep 60; shutdown -h now; fi; done;'
