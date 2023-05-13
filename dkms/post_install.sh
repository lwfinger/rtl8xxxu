#! /bin/sh

BLCONF="/etc/modprobe.d/blacklist-rtl8xxxu.conf"

echo "blacklist rtl8xxxu" > ${BLCONF}

exit 0
