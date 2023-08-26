### Linux Kernel Module "rtl8xxxu"

Driver for Realtek RTL8XXXXU usb wifi chips, which is backported from linux mainline
<details>
<summary>Click here to display a list of supported chips</summary>
<pre><code>
RTL8188CU/CUS/CTV
RTL8188EU/EUS/ETV
RTL8188FU/FTV
RTL8188GU | RTL8188RU
RTL8191CU | RTL8192CU 
RTL8192EU | RTL8192FU
RTL8723AU | RTL8723BU
</code></pre>
</details>

### How To Use

1. If your usb wifi dongle uses a RTL8188GU or RTL8192FU chip, you may need to

   switch it to "Wifi Mode" first by using the "usb_modeswitch" or "eject" command

2.  You will need to install "make", "gcc", "kernel headers", "kernel build essentials", and "git".
	You can install them with the following command, on **Ubuntu**:
```bash
	sudo apt-get update
	sudo apt-get install make gcc linux-headers-$(uname -r) build-essential git
```
	For **Fedora**: You can install them with the following command
```bash
	sudo dnf install kernel-headers kernel-devel
	sudo dnf group install "C Development Tools and Libraries"
```
	For **openSUSE**: Install necessary headers with
```bash
	sudo zypper install make gcc kernel-devel kernel-default-devel git libopenssl-devel
```
	For **Arch**: After installing the necessary kernel headers and base-devel,
```bash
	git clone https://aur.archlinux.org/rtw88-dkms-git.git
	cd rtw88-dkms-git
	makepkg -sri
```
If any of the packages above are not found check if your distro installs them under different names.


3. Build and install the module 

   * _In a traditional way_

     `make clean modules && sudo make install`

   * _In a DKMS way_

     `sudo dkms install $PWD`

   * _For Arch-based Linux distro users_

     Install [rtl8xxxu-dkms-git](https://aur.archlinux.org/packages/rtl8xxxu-dkms-git) package from AUR.

4. Install firmware for RTL8188EU/RTL8188FU/RTL8188GU/RTL8192EU/RTL8192FU chips (Optional)

   $ sudo make install_fw

5. Load the module

   $ sudo modprobe rtl8xxxu_git

### Note

Supported linux kernel version: 5.15.x ~ 6.5.x

Thanks to all the maintainers of this kernel module!

### WARNING

No warranty, use at your own risk. :warning:
