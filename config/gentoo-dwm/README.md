# Gentoo dwm build

This build uses portage to handle compiling dwm. Use the following workflow when editting the build

* make your edits to the sym linked config file, which is found `/etc/portage/savedconfig/x11-wm/dwm-6.2.h`
* `sudo emerge -av dwm`
* super + shift + q to exit X, then log in again
* if you are happy with your changes then `sudo cp /etc/portage/savedconfig/x11-wm/dwm-6.2 /etc/portage/savedconfig/x11-wm/dwm-6.2.h.bak`
* then copy the backup to this dir `sudo cp /etc/portage/savedconfig/x11-wm/dwm-6.2.h.bak ~/utils/.dotfiles/config/gentoo-dwm/dwm-6.2.h`

Installed Patches (found `/etc/portage/patches/x11-wm/dwm`):

* drw-patches-6.2.diff (important for displaying unicode and emojis)
* dwm-fullgaps-6.2.diff (vanity gaps between windows)

For the status bar I use [dwmblocks](https://github.com/torrinfail/dwmblocks)

Gentoo provide some great docs [here](https://wiki.gentoo.org/wiki/Dwm)
For a guide on patching see https://youtu.be/B1hPa03pONQ
