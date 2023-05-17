# SPDX-License-Identifier: GPL-2.0-only

ifneq ($(KERNELRELEASE),)

obj-m	:= rtl8xxxu_git.o

rtl8xxxu_git-y	:= rtl8xxxu_core.o rtl8xxxu_8192e.o rtl8xxxu_8723b.o \
		   rtl8xxxu_8723a.o rtl8xxxu_8192c.o rtl8xxxu_8188f.o \
		   rtl8xxxu_8188e.o rtl8xxxu_8710b.o rtl8xxxu_8192f.o

else

KVER ?= `uname -r`
KDIR ?= /lib/modules/$(KVER)/build
MODDIR ?= /lib/modules/$(KVER)/extra
FWDIR := /lib/firmware/rtlwifi
BLCONF := /etc/modprobe.d/blacklist-rtl8xxxu.conf

.PHONY: modules clean install install_fw uninstall

modules:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

install:
	strip -g rtl8xxxu_git.ko
	@install -Dvm 644 -t $(MODDIR) rtl8xxxu_git.ko
	echo "blacklist rtl8xxxu" > $(BLCONF)
	depmod -a $(KVER)
	
install_fw:
	@install -Dvm 644 -t $(FWDIR) firmware/*

uninstall:
	@rm -vf $(MODDIR)/rtl8xxxu_git.ko
	@rm -vf $(BLCONF)
	depmod -a $(KVER)
	@rmdir --ignore-fail-on-non-empty $(MODDIR)

endif
