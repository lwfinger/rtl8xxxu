#! /bin/sh

FWDIR="/lib/firmware/rtlwifi"
BLCONF="/etc/modprobe.d/blacklist-rtl8xxxu.conf"

if [ ! -d ${FWDIR} ]; then
	mkdir -p ${FWDIR}
fi

cp -v firmware/rtl8710bufw_*.bin ${FWDIR}

echo blacklist rtl8xxxu > ${BLCONF}

exit 0
