#!/bin/bash
cd /media/piotoor/
sudo umount $1
sudo cryptsetup luksClose /dev/mapper/$1
cd -
