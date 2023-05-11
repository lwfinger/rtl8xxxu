### RTL8188GU Driver for Linux

Backporting the RTL8188GU driver to the old kernels from the linux git tree.

The following chips are also supported.

RTL8723AU / RTL8723BU

RTL8188CU / RTL8188EU / RTL8188FU / RTL8188RU

RTL8191CU / RTL8192CU / RTL8192EU / RTL8192FU

### How To Use

1. Install gcc, make, linux-headers and other packages required to build this driver

2. If your usb wifi dongle uses RTL8188GU or RTL8192FU chip,

   switch it to "Wifi Mode" first by using the "usb_modeswitch" or "eject" command.

3. Build and install the driver

   (In a traditional way)

   $ make clean modules && sudo make install

   (In a DKMS way)

   $ sudo dkms install $PWD

4. Load the driver

   $ sudo modprobe rtl8xxxu_git

### Note

Supported linux kernel version: 6.0.x ~ 6.3.x

Tested on Debian 11.6 (kernel version: 6.1.0-0.deb11.6-amd64) and it works fine.

Thanks to the author Bitterblue Smith and all the maintainers of this kernel module!

### WARNING

No warranty, use at your own risk.
