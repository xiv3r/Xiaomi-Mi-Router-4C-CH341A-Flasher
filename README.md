# <h1 align="center">Flashing Xiaomi Router 4C using CH341A USB Programmer</h1>

- Note: unchecked `verify` from the programmer settings before flashing it
- Note: `unprotect` eeprom before flashing..
- Note:(Dangerous and irreversible, set only required options (if you're failed buy a new nor flash memory and replace the old one then solder the new spi nor flash memory unto the board) if you follow correctly, then you can reflash EEPROM flash 10,000-100,000 times. All you have to do if the programmer unable to read eeprom sectors first read the `SREG or Status Register` and `unchecked all `checked area or set all 1 numbers into `0` and `Write Register` then begin flashing 


# <h1 align="center"> Windows </h1>

- Download Firmware: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

     [Full Dump Firmware](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)

- ASProgrammer 2.0.4:

     [ASProgrammer](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/AsProgrammer_2.0.4.zip)

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

![image](https://github.com/xiv3r/Xiaomi-Router-4C-CH34A-flash-firmware/assets/117867334/dd03fa11-4b8d-47f5-b878-eb790ec73332)


# <h1 align="center"> Linux </h1>

### Install IMSProg with Graphical Interface

  - Dependencies:

        sudo apt update
        sudo apt install cmake g++ libusb-1.0-0-dev qtbase5-dev pkgconf system-dev udev -y

  1. Download [IMSProgrammer](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/imsprog_1.3.1-2_amd64.deb)

  2. type:`cd /home/*/Downloads`
  
  3. type:`sudo dpkg -i imsprog_1.3.1-2_amd64.deb ; apt --fix-broken install ; dpkg --configure -a`
 
  4. run IMSProg from application windows

  5. [IMSprog overview](https://github.com/bigbigmdm/IMSProg)


 
### Install Flashrom:

     sudo apt update
  
     sudo apt install flashrom -y
  
   
- Download [CH341PAR_LINUX.zip](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341PAR_LINUX.ZIP) & [CH341SER_LINUX.zip](https://raw.githubusercontent.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/main/CH341SER_LINUX.ZIP) Drivers (optional)

- Plug your ch341a Programmer on your pc and type `lsusb` and look if your device is detected


   [CH341A Driver](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/files/12224825/driver.zip)


- Driver installation (Optional):

   Dependencies: sudo apt install bc build-essential gcc cmake -y
  
Extract the driver.zip and open your root terminal then drop the unzip driver folder to the terminal or manually locate the driver like cd /home/(name)/driver

![Screenshot_20230801_132017](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/assets/117867334/fc367842-6724-4f66-80a5-6409bd93190b)


- Execute root terminal type:

      sudo make && sudo make install

# <h1 align="center"> Flashing with Flashrom </h1>

- Note: chip type depends on your EEPROM type detected by flashrom like GD25B128B/'GD25Q128B', GD25Q127C/'GD25Q128C' you may add it to the -c flags before backup or flashing

- To Detect Flash the Chip execute the command below:

      flashrom -VV -p ch341a_spi -r backup.bin
 
- Backup Dump firmware: 

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -r MIR4C-dump.bin

- Flash New Dump firmware:

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -v -E -w /home/user/Downloads/( your New firmware).bin
