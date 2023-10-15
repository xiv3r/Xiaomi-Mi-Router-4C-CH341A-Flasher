# <h1 align="center">Flashing Xiaomi Router 4C using ch341a usb programmer</h1>

- Note: This dump firmware is only for GIGA DEVICE GD25Q128 B/C/XXXX




# <h1 align="center"> Windows </h1>

- Download Firmware: | Stock Firmware | Openwrt | X-WRT | Keenetic | PCWRT | ImmortalWRT | Padavan |

     [Full Dump Firmware](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/tag/V1)


- Neoprogrammer 2.1.0.10:
  
     [Neoprogrammer](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/NeoProgrammer.V2.2.0.10.zip)

- ASProgrammer 2.0.4:

     [ASProgrammer](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/releases/download/V1/AsProgrammer_2.0.4.zip)


- Steps: connect ch341a clip to 4c router IC, open neoprogrammer and detect the chip select the router IC, read the IC, erase the ic, load the 16mb firmware 
  (stock or openwrt) then write IC click yes and wait and start configure your router



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


- Install Flashrom:

      apt update
  
      apt install flashrom -y
  
   
- CH341a Linux Driver:


   [CH341A Driver](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/files/12224825/driver.zip)


- Driver installation:
  
Extract the driver.zip and open your root terminal then drop the unzip driver folder to the terminal or manually locate the driver like cd /home/(name)/driver

![Screenshot_20230801_132017](https://github.com/xiv3r/Xiaomi-Router-4C-CH341A-flasher/assets/117867334/fc367842-6724-4f66-80a5-6409bd93190b)


- Execute root terminal type:

      sudo make && sudo make install

# <h1 align="center"> Flashing with Flashrom </h1>

- Note: chip type depends on your EEPROM type detected by flashrom like GD25B128B/'GD25Q128B', GD25Q127C/'GD25Q128C' you may add it to the -c flags before backup or flashing


 
- Backup Dump firmware: 

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -r MIR4C-dump.bin

- Flash New Dump firmware:

      flashrom -VV -p ch341a_spi -c GD25B128B/GD25Q128B -v -E -w /home/user/Downloads/( your New firmware).bin
