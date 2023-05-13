### Kernel Module "rtl8xxxu" Backported from the Linux Git Tree

The following chips are supported currently.

RTL8188CU / RTL8188EU / RTL8188FU / RTL8188GU / RTL8188RU

RTL8191CU / RTL8192CU / RTL8192EU / RTL8192FU

RTL8723AU / RTL8723BU

### How To Use

1. If your usb wifi dongle uses a RTL8188GU or RTL8192FU chip, you may need to

   switch it to "Wifi Mode" first by using the "usb_modeswitch" or "eject" command

2. Install gcc, make, linux-headers and other packages required to build this module

3. Build and install the module 

   (In a traditional way)

   $ make clean modules && sudo make install

   (In a DKMS way)

   $ sudo dkms install $PWD

4. Install the firmware for RTL8188FU/RTL8188GU/RTL8192EU/RTL8192FU chips (Optional)

   $ sudo make install_fw

5. Load the module

   $ sudo modprobe rtl8xxxu_git

### Note

Supported linux kernel version: 6.0.x ~ 6.3.x

Tested on Debian 11.6 (kernel version: 6.1.0-0.deb11.6-amd64) and it works fine.

Thanks to all the maintainers of this kernel module!

### WARNING

No warranty, use at your own risk.
