# SPDX-License-Identifier: GPL-2.0-only

ifneq ($(KERNELRELEASE),)

obj-m	:= rtl8xxxu_git.o

rtl8xxxu_git-y	:= rtl8xxxu_core.o rtl8xxxu_8192e.o rtl8xxxu_8723b.o \
		   rtl8xxxu_8723a.o rtl8xxxu_8192c.o rtl8xxxu_8188f.o \
		   rtl8xxxu_8188e.o rtl8xxxu_8710b.o

else

KVER ?= `uname -r`
KDIR ?= /lib/modules/$(KVER)/build
MODDIR ?= /lib/modules/$(KVER)/extra
FWDIR := /lib/firmware/rtlwifi
BLCONF := /etc/modprobe.d/blacklist-rtl8xxxu.conf

modules:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

install:
	@mkdir -pv $(MODDIR)
	@mkdir -pv $(FWDIR)
	strip -g rtl8xxxu_git.ko
	install -p -m 644 rtl8xxxu_git.ko $(MODDIR)
	@cp -v rtl8710bufw_*.bin $(FWDIR)
	echo blacklist rtl8xxxu > $(BLCONF)
	depmod -a $(KVER)

uninstall:
	@rm -vf $(MODDIR)/rtl8xxxu_git.ko
	@rm -vf $(FWDIR)/rtl8710bufw_*.bin
	@rm -vf $(BLCONF)
	depmod -a $(KVER)
	@rmdir --ignore-fail-on-non-empty $(FWDIR)
	@rmdir --ignore-fail-on-non-empty $(MODDIR)

endif
