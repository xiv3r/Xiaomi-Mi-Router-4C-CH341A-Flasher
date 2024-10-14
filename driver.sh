#!/bin/sh

sudo apt install bc build-essential gcc cmake make linux-headers-$(uname -r) -y
mkdir -p ch341a-driver && cd ch341a-driver
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/Makefile > Makefile
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/ch341.c > ch341.c
curl https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver/ch341a-ser/ch341.h > ch341.h
sudo make
sudo make load
sudo make unload
sudo make install
