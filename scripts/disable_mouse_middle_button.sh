#!/bin/bash -ex

xinput set-button-map $(xinput list | grep 'PixArt Dell MS116 USB Optical Mouse' | sed -e 's/^.*id=//' | sed -e 's/\s.*$//') 1 0 3
