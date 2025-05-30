#!/bin/sh

###
sudo apt install bc build-essential gcc cmake make linux-headers-$(uname -r) cmake g++ libusb-1.0-0-dev qtbase5-dev qttools5-dev pkgconf systemd-dev udev zenity wget -y
###
sudo mkdir -p ch341a-ser
###
cd ch341a-ser
###
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/Makefile > Makefile
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/ch341.c > ch341.c
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/ch341.h > ch341.h
###
echo "installing ch341a serial driver"
###
sudo make
###
sudo make load
###
sudo make unload
###
sudo make install 
