# SPDX-License-Identifier: GPL-2.0-only

ifneq ($(KERNELRELEASE),)

obj-m	+= rtl8xxxu_git.o

rtl8xxxu_git-y	:= rtl8xxxu_core.o rtl8xxxu_8192e.o rtl8xxxu_8723b.o \
		   rtl8xxxu_8723a.o rtl8xxxu_8192c.o rtl8xxxu_8188f.o \
		   rtl8xxxu_8188e.o rtl8xxxu_8710b.o

ldflags-y += --strip-debug

else

KVER ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KVER)/build
DESTDIR ?= /lib/modules/$(KVER)/kernel/drivers/net/wireless/realtek/rtl8xxxu
BLCONF := /etc/modprobe.d/blacklist-rtl8xxxu.conf

modules:
	make -C $(KDIR) M=$$PWD modules

clean:
	make -C $(KDIR) M=$$PWD clean

install:
	install -p -m 644 rtl8xxxu_git.ko $(DESTDIR)
	@mkdir -p /lib/firmware/rtlwifi
	@cp -v rtl8710bufw_*.bin /lib/firmware/rtlwifi
	echo blacklist rtl8xxxu > $(BLCONF)
	depmod -a $(KVER)

uninstall:
	@rm -vf $(DESTDIR)/rtl8xxxu_git.ko
	@rm -vf /lib/firmware/rtlwifi/rtl8710bufw_*.bin
	@rm -vf $(BLCONF)
	depmod -a $(KVER)

endif
