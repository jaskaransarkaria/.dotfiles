#!/bin/bash

set -ex

make -j20
emerge --ask @module-rebuild
modprobe r8125
make -j20 modules_install
make -j20 install
grub-mkconfig -o /boot/grub/grub.cfg

echo "Now reboot..."

exit 0
