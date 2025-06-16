#!/bin/sh

###
opkg update && opkg install kmod-mtd-rw
###
wget -O /tmp/breed.bin https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/breed-ch.bin
###
mtd -r write /tmp/breed.bin bootloader
