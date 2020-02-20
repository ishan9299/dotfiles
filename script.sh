#!/usr/bin/env bash
ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
hwclock --systohc
touch /etc/hostname
echo "archlinux" > /etc/hostname
if [[ -a /etc/locale.conf ]]
then
    echo "locale"
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
fi
nvim /etc/locale.gen
