#!/bin/bash
sudo cryptsetup luksOpen /dev/$1 $2
cd /media/piotoor/
sudo mount /dev/mapper/$2 $2
cd -
