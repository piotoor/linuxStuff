#!/bin/env bash

username=$1
if [ $# -ne 1 ]
then
  echo "1 argument expected. Provided $#"
  exit 1
fi

su $username
if [ $? -ne 0 ]
then
  echo "Wrong user credentials"
  exit 1
fi

sudo apt-get update;
sudo apt-get upgrade

echo "-------------------- Downloading java -------------------- ";
sudo apt-get --assume-yes install default-jre;
sudo apt-get --assume-yes install default-jdk;
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get --assume-yes install java-common oracle-java8-installer
sudo apt-get --assume-yes install oracle-java8-set-default
source /etc/profile

echo "-------------------- Downloading video related apps -------------------- ";
sudo apt-get --assume-yes install smplayer;
sudo apt-get --assume-yes install qnapi;
sudo apt-get --assume-yes install vlc browser-plugin-vlc;

echo "-------------------- Downloading browsers and editors -------------------- ";
sudo apt-get --assume-yes install gthumb;
sudo apt-get --assume-yes install gimp;
sudo apt-get --assume-yes install notepadqq
sudo add-apt-repository ppa:libreoffice/ppa
sudo apt-get update
sudo apt-get --assume-yes install libreoffice

echo "-------------------- Downloading development stuff -------------------- ";
sudo apt-get --assume-yes install build-essential;
sudo apt-get --assume-yes install git;
sudo apt-get --assume-yes install vim;
sudo apt-get --assume-yes install tree;
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt update;
sudo apt -y install atom;
sudo apt-get --assume-yes install codeblocks;
sudo apt-get --assume-yes install sqlite3 libsqlite3-dev;
sudo apt-get --assume-yes install python
sudo apt-get --assume-yes install python3
sudo apt-get --assume-yes install python-pip
sudo pip install numpy
sudo apt-get --assume-yes install snap
sudo snap install pycharm-community --classic

sudo apt-get --assume-yes install libc6-armel-cross libc6-dev-armel-cross
sudo apt-get --assume-yes install binutils-arm-linux-gnueabi
sudo apt-get --assume-yes install libncurses5-dev
sudo apt --assume-yes install gcc-arm-linux-gnueabi
sudo apt --assume-yes install g++-arm-linux-gnueabi
sudo apt --assume-yes install codeblocks-contrib
sudo apt-get --assume-yes install libsfml-dev

echo "-------------------- Downloading communicators -------------------- ";
sudo apt-get --assume-yes install kadu
sudo snap install discord
sudo snap install slack --classic
sudo apt-get --assume-yes install zoom

echo "-------------------- Downloading 3D modelling software -------------------- ";
sudo add-apt-repository -y ppa:openscad/releases
sudo apt-get update
sudo apt-get --assume-yes install openscad

echo "-------------------- Downloading learning apps -------------------- ";
sudo apt-get update && sudo apt-get --assume-yes install p7zip-full p7zip-rar

cd /tmp
mkdir anki
cd anki
wget https://apps.ankiweb.net/downloads/current/anki-2.1.26-linux-amd64.tar.bz2
tar xjf anki-2.1.26-linux-amd64.tar.bz2
cd anki-2.1.26-linux-amd64
sudo make install
cd /home/$username

echo "-------------------- Downloading flash  -------------------- ";
sudo apt-get --assume-yes install flashplugin-installer;

echo "-------------------- Downloading bluetooth stuff -------------------- ";
sudo apt-get --assume-yes install blueman

echo "-------------------- Downloading security & backups stuff -------------------- ";
cd /tmp
wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i nordvpn-release_1.0.0_all.deb
sudo apt-get update
sudo apt-get install nordvpn
cd

sudo apt --assume-yes install cryptsetup
sudo apt-get --assume-yes install bleachbit
sudo apt-get --assume-yes install rsync

echo "-------------------- Downloading grub stuff -------------------- ";
sudo apt-get install grub-imageboot

echo "-------------------- Downloading other utilities -------------------- ";
sudo apt-get --assume-yes install qbittorrent;

echo "-------------------- Configuring git -------------------- ";
sudo apt-get install --assume-yes kdiff3

git config --global user.email "piotoor@gmail.com"
git config --global user.name "Piotr Kozka"
git config --global core.editor nano
git config --global diff.tool kdiff3
git config --global merge.tool kdiff3
git config --global mergetool.meld.path=/usr/bin/kdiff3
git config --global difftool.meld.path=/usr/bin/kdiff3

git config --global color.ui true
git config --global color.status.changed red
git config --global color.status.untracked magenta
git config --global color.status.header "white normal dim"

echo "-------------------- Getting repos -------------------- ";
cd /home/$username
mkdir Repos
cd Repos
git clone https://github.com/piotoor/programmingCore.git
git clone https://github.com/piotoor/linuxStuff.git
git clone https://piotoor@bitbucket.org/piotoor/speedcubingalgorithms.git
git clone https://github.com/piotoor/ev3dev-printer.git
git clone https://github.com/piotoor/sfmlRaycaster.git
git clone https://github.com/piotoor/ruGroupAnalyser.git
git clone https://github.com/piotoor/AdventOfCode2021
cd
