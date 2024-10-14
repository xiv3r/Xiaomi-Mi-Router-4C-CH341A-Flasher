#!/bin/sh

sudo apt install bc build-essential gcc cmake make linux-headers-$(uname -r) -y
mkdir -p ch341a
cd ch341
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/Makefile > Makefile
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341.c > ch341.c
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341.h > ch341.h
sudo make
sudo make load
sudo make unload
sudo make install
