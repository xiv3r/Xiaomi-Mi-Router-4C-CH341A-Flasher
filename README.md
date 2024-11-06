# <h1 align="center">CH341A Programmer for dumping, installing, reflashing and recovery of Xiaomi Router 4C</h1>

## Notes
> [!Note]
> Unchecked `Verify` from the programmer settings before flashing it
> `Unprotect` eeprom before flashing..
> Dangerous and irreversible actions, set only required options (if may failed buy a new ones and then soldered it unto the board)
> if the programmer fail to read the eeprom sectors all you have to do is read the `SREG or Status Register` and `unchecked all `checked area or set all number `1` into `0` and then `Write Register`.


# <h1 align="center"> Windows </h1>

- Available Firmwares: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

- [Full Dump Firmware DOWNLOAD](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)

- [ASProgrammer 2.1.0](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/AsProgrammer_2.1.0.zip)

- Download [CH341PAR.EXE](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341PAR.EXE) & [CH341SER.EXE](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341SER.EXE) and install

### Setup
> connect the ch341a clip to Xiaomi 4c router EEPROM, open asprogrammer then `detect` the chip select the specific router IC model, click `read` the IC and make a backup then proceed to erase ic, load the 16mb firmware into it (stock, openwrt, padavan, keenetic, immortal) then click `write` IC click yes and wait after it finish finally connect your router to your pc and open 192.168.1.1(3rd party) or 192.168.31.1(stock)


![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/704a2efb-d911-4737-8670-8480cfe073e0)


![IMG_20230723_083113](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/8c399a16-f7a1-4e77-b900-d4bfa674f79d)


![IMG_20230723_083150](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/bf2053cc-a585-41b9-b8a0-b150ddcbd87e)


![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/32c84a15-dd5d-43b0-87b1-6be5aeccad41)

![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/76807418-5626-4829-a0f4-aebe305701ba)
![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/5621d78b-b314-4ba8-8fec-1badffd65141)

> Red wire must be connected to this pin #1 (dot) in chip

![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/466c5aad-61c9-498a-bd1e-c9171fe64c86)


<br><br></br>

# <h1 align="center"> Linux </h1>

# Driver Auto install (optional)
```sh
sudo apt update && wget -qO- https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/refs/heads/main/driver.sh | sudo sh
```
- Check existing drivers
```sh
lsmod | grep ch341
Bus 001 Device 002: ID 1a86:5512 QinHeng Electronics HL-340 USB-Serial adapter
ch341                  20480  0
usbserial             45056  1 ch341
```
![Screenshot_20230801_132017](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/assets/117867334/fc367842-6724-4f66-80a5-6409bd93190b)

<br><br></br>

# Install IMSProg:

> [!Note]
> if the EEPROM unable to read by the programmer go to `Imsprog Settings` -> `CHIP Info` -> `Read Status Register` and replace all number `1` into `0` and `Write` then begin flashing the firmware.


- Available Firmwares: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

- [Full Dump Firmware DOWNLOAD](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)
 

- Download and install IMSProg
```sh
sudo apt update && sudo apt install imsprog -y
```
- Dependencies
```sh
sudo apt install bc build-essential gcc cmake make linux-headers-$(uname -r) cmake g++ libusb-1.0-0-dev qtbase5-dev qttools5-dev pkgconf systemd-dev udev zenity wget -y
```
- Install from Repo (optional)
```sh
wget https://launchpad.net/~bigmdm/+archive/ubuntu/imsprog/+files/imsprog_1.4.4-4_amd64.deb -O imsprog.deb && sudo dpkg -i imsprog.deb && sudo apt --fix-broken install -y && sudo dpkg --configure -a
```
- Build from Source (optional)
```sh
git clone https://github.com/bigbigmdm/IMSProg.git && cd IMSProg
cd IMSProg_programmer
mkdir build
cd build
cmake ..
make -j`nproc`
sudo make install
```
- [IMSProg overview](https://github.com/bigbigmdm/IMSProg)

- Select IMSProg from the Application Menu

<br>
<br>
</br>

# Install Flashrom:
```sh
sudo apt update ; sudo apt install flashrom -y
```

# <h1 align="center"> Flashing with Flashrom </h1>
> [!Note]
> chip type depends on your EEPROM type detected by flashrom like GD25B128B/'GD25Q128B', GD25Q127C/'GD25Q128C' you may add it to the -c flags before backup or flashing

- To Detect the Flash Chip execute the command below:
```sh
flashrom -VV -p ch341a_spi -r backup.bin
```
- Backup Dump firmware: 
```sh
flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -r MIR4C-dump.bin
```
- Flash New Dump firmware:
```sh
flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -v -E -w /home/user/Downloads/MIR4C-dump.bin
```

<br><br></br>

<h1 align="center"> Termux </h1>

# Requirements
- Access Point Router/CPE (Wired Bridge) (required) if `ALL` exit in the MTD partition tables
- CH341A Programmer (optional) if there's no `ALL` existed in the MTD partition tables
- Termux

• Dependencies:
```sh
apt update && apt upgrade -y && apt install git wget python3 python-pip inetutils -y
```

# Notes
> [!Note]
> To check mtd partitions `cat /proc/mtd`
> If mtd `ALL` partition is found yo can flash it easily but if not found otherwise flash the eeprom with CH341a programmer
> MTD `ALL` Partition can flash all 16MB dump firmware from the download section
> Keenetic Breed `Programmer Firmware` can Flash all 16MB dump firmware from the download section
> All 16MB firmware dump are stable for transitioning
> You can use wget, scp, http fileserver to import firmware into `/tmp` directory and flash
  > Mode of firmware import
  - `cd Download && scp 16mb_firmware.bin root@192.168.1.1:/tmp`
  - `cd Download && python3 -m http.server` (dhcp ip assign):8000 e.g: `wget 192.168.1.111:8000/16mb_firmware.bin`
  - `cd /tmp && wget https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/releases/download/V1/Full-KeeneticOS_4.1.7_MOD.bin`
 > Flashing
  - `mtd -e ALL -r write /tmp/16mb_firmware.bin ALL`
# Transition from Stock to other firmwares
• Using my Modified version of openwrt-invasion
```sh
termux-setup-storage && pkg update && pkg upgrade && pkg install curl && curl https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.sh | sh && cd openwrt-invasion
```

• `Reset` the Xiaomi 4C Router and configure with a password of `12345678`
```sh
python3 remote_command_execution_vulnerability.py
```

• Getting root access via Telnet
```sh
 telnet 192.168.31.1
```
  - login:`root`
  - password:`root`

- Download the firmware from [Here!](https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/releases/download/V1/)
   - e.g
```sh
cd /tmp && wget -O Keenetic.bin https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/releases/download/V1/Full-KeeneticOS_4.1.7_MOD.bin
```
• Flashing the 16mb dump firmware 
```sh
mtd -e ALL -r write /tmp/keenetic.bin ALL
```
- Wait for 15 minutes until the reboot will prompted
- Goto [192.168.1.1](http://192.168.1.1/)

# Transition from Openwrt/Xwrt/Immortalwrt/pcwrt to Keenetic and others
- Import the [Xiaomi_4C_Router_Breed.bin](https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/Xiaomi_4C_Router_Breed_Env_Variables.bin)
```sh
telnet 192.168.1.1`
```
   - user:`root`
   - pass:`your admin password`
- Breed bootloader installation
```sh 
opkg update && opkg install kmod-mtd-rw && insmod mtd-rw i_want_a_brick=1
```
```sh
cd /tmp && wget -O breed.bin https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/Xiaomi_4C_Router_Breed_Env_Variables.bin
```
```sh
mtd -e bootloader -r write /tmp/breed.bin bootloader
```
- Router will reboot
- Goto 👉 [192.68.1.1](http://192.168.1.1) > `upgrade` > `Programmer firmware` > import `keenetic 16MB dump` from download 
<img src="https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/src/backup.jpg">

- Unchecked `skip bootloader`
- Unchecked `skip eeprom`
- Upload

# Transition from Keenetic to Openwrt and others
- Hold the reset button for 5 seconds while powering on the router
- Goto 👉[192.168.1.1](http://192.168.1.1) > `upgrade` > `programmer firmware` > import `openwrt 16MB dump` from download
<img src="https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/src/backup.jpg">

- Unchecked `skip bootloader`
- Unchecked `skip eeprom`
- Upload
- 
# OpenWRT WiFi tx power mod to 30dBm
wget -qO- https://raw.githubusercontent.com/xiv3r/20dBm-30dBm-Xiaomi-Mi-4C-Router-Mod/refs/heads/main/mtd2-mod.sh | sh

# Transition from Padavan to other firmwares
- `telnet 192.168.1.1` and login your credentials
- Import `16mb dump firmware.bin` to `/tmp`
- e.g ` cd /tmp && wget -O keenetic.bin https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/releases/download/V1/Full-KeeneticOS_4.1.7_MOD.bin`
```sh
mtd -e ALL -r write /tmp/keenetic.bin ALL
```

# [USB MOD](https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/USB-MOD.jpg)
