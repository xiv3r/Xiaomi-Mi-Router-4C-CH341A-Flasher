# <h1 align="center">CH341A Programmer for dumping and reflashing Xiaomi Router 4C 16MB EEPROM</h1>

- Note: unchecked `verify` from the programmer settings before flashing it
- Note: `unprotect` eeprom before flashing..
- Note:Dangerous and irreversible actions, set only required options (if may failed buy a new ones and replace the old one then soldered it unto the board) if the programmer unable to read eeprom sectors all you have to do is read the `SREG or Status Register` and `unchecked all `checked area or set all number 1 into `0` and `Write Register` then begin flashing.


# <h1 align="center"> Windows </h1>

- Available Firmwares: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

- [Full Dump Firmware](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)

- [ASProgrammer 2.0.4](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/AsProgrammer_2.0.4.zip)

- Download [CH341PAR.EXE](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341PAR.EXE) & [CH341SER.EXE](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341SER.EXE) and install

- Steps: connect the ch341a clip to Xiaomi 4c router EEPROM, open asprogrammer then `detect` the chip select the specific router IC model, click `read` the IC and make a backup then proceed to erase ic, load the 16mb firmware into it
  (stock, openwrt, padavan, keenetic, immortal) then click `write` IC click yes and wait after it finish finally connect your router to your pc and open 192.168.1.1(3rd party) or 192.168.31.1(stock)


![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/704a2efb-d911-4737-8670-8480cfe073e0)


![IMG_20230723_083113](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/8c399a16-f7a1-4e77-b900-d4bfa674f79d)


![IMG_20230723_083150](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/bf2053cc-a585-41b9-b8a0-b150ddcbd87e)


![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/32c84a15-dd5d-43b0-87b1-6be5aeccad41)

![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/76807418-5626-4829-a0f4-aebe305701ba)
![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/5621d78b-b314-4ba8-8fec-1badffd65141)

- Red wire must be connected to this pin #1 (dot) in chip

![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/466c5aad-61c9-498a-bd1e-c9171fe64c86)



# <h1 align="center"> Linux </h1>

### Drivers(optional):[CH341PAR_LINUX.zip](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341PAR_LINUX.ZIP) & [CH341SER_LINUX.zip](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341SER_LINUX.ZIP)

- Driver Dependencies:

      sudo apt update ; sudo apt install bc build-essential gcc cmake -y

* Extract driver into the root terminal and cd into it then run `make ; make install`

![Screenshot_20230801_132017](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/assets/117867334/fc367842-6724-4f66-80a5-6409bd93190b)

# Install IMSProg:

* Note: if the EEPROM unable to read by the programmer go to `Imsprog Settings` -> `CHIP Info` -> `Read Status Register` and replace all number `1` into `0` and `Write` then begin flashing the firmware.


- Available Firmwares: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

- [Full Dump Firmware](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)
  

- Dependencies:

      sudo apt update ; sudo apt install imsprog -y

- [IMSProg overview](https://github.com/bigbigmdm/IMSProg)

- Select IMSProg from the Application Menu

 
# Install Flashrom:

     sudo apt update ; sudo apt install flashrom -y


# <h1 align="center"> Flashing with Flashrom </h1>

- Note: chip type depends on your EEPROM type detected by flashrom like GD25B128B/'GD25Q128B', GD25Q127C/'GD25Q128C' you may add it to the -c flags before backup or flashing

- To Detect the Flash Chip execute the command below:

      flashrom -VV -p ch341a_spi -r backup.bin
 
- Backup Dump firmware: 

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -r MIR4C-dump.bin

- Flash New Dump firmware:

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -v -E -w /home/user/Downloads/MIR4C-dump.bin

<h1 align="center"> Termux </h1>

# Dependencies 

    pkg update ; pkg upgrade ; apt install python3 python-pip openssh inetutils -y

# Transition from Openwrt/Xwrt/Immortalwrt/pcwrt to Keenetic and others without using a programmer
- Import the [Xiaomi_4C_Router_Breed.bin](https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/Xiaomi_4C_Router_Breed_Env_Variables.bin) into `/tmp`
- `opkg update; opkg install kmod-mtd-rw`
- `insmod mtd-rw.ko i_want_a_brick=1`
- `mtd -e bootloader -r write /tmp/Xiaomi_4C_Router_Breed.bin bootloader`
- Go to 192.68.1.1 > `upgrade` > `Programmer` > import `keenetic 16MB dump`
- Unchecked `skip bootloader`
- Unchecked `skip eeprom`
- Apply Upgrade

# Transition from Keenetic to Openwrt and others without using a programmer
- Hold the reset button for 5 seconds while powering on the router
- Go to `192.168.1.1` > `upgrade` > `programmer` > import `openwrt 16MB dump`
- Unchecked `skip bootloader`
- Unchecked `skip eeprom`
- Apply Upgrade

# Transition from Stock to other firmware without using a programmer
• We're using Termux.apk
• Dependencies:
 - `apt update; apt upgrade -y ; apt install git wget python3 python-pip inetutils -y`

• Installing Openwrt Invasion
  - `git clone https://github.com/acecilia/OpenWRTInvasion.git`

• Invading the stock
  - `cd OpenWRTInvasion`
  - `pip3 install -r requirements.txt`

• `Reset` the Xiaomi 4C Router and setup with a password of `12345678`
  - `python3 remote_command_execution_vulnerability.py`

• Getting root access via Telnet
  - `telnet 192.168.1.1`
  - login:`root`
  - password:`root`
 
• Import the firmware
  - Build a http web file server `python3 -m http.server` (bind to pc ip eg. 192.168.31.123:8000).
  - Go to the browser `192.168.31.123:8000` locate the 16mb firmware & copy the download link.
  - Import the 16mb firmware into ` cd /tmp` directory.
  - Example:`wget http://192.168.31.123:8000/Downloads/16mb_firmware.bin`

• Flashing the 16mb dump
  - `mtd -e all -r write /tmp/16mb_firmware.bin all`

# Transition from Padavan to other firmware without using a programmer
- `telnet 192.168.1.1`
- import `16mb dump firmware.bin` into padavan `cd /tmp`
- `mtd -e all -r write /tmp/16mb_dump_firmware.bin all`

# [USB MOD](https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/USB-MOD.jpg)
