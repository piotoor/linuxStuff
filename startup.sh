#!/bin/bash

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

echo "-------------------- Downloading music related apps -------------------- ";
sudo apt-get --assume-yes install banshee;

echo "-------------------- Downloading drivers -------------------- ";
sudo apt-get --assume-yes install nvidia-384;

echo "-------------------- Downloading video related apps -------------------- ";
sudo apt-get --assume-yes install smplayer;
sudo apt-get --assume-yes install qnapi;
sudo apt-get --assume-yes install vlc browser-plugin-vlc;

echo "-------------------- Downloading browsers and editors -------------------- ";
sudo apt-get --assume-yes install gthumb;
sudo apt-get --assume-yes install gimp;

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
sudo apt-get --assume-yes install golang

sudo add-apt-repository -y ppa:maarten-fonville/android-studio
sudo apt update
sudo apt -y install android-studio

cd /usr/src
wget https://www.python.org/ftp/python/3.4.5/Python-3.4.5.tgz
sudo tar xzf Python-3.4.5.tgz
cd Python-3.4.5
sudo ./configure
sudo make altinstall

sudo apt-get --assume-yes install intltool itstool gir1.2-gtksource-3.0 libxml2-utils
git clone https://git.gnome.org/browse/meld
cd meld
sudo python setup.py install
cd

echo "-------------------- Downloading communicators -------------------- ";
sudo apg-get --assume-yes install kadu;



echo "-------------------- Other apps -------------------- ";
sudo apt-get update && sudo apt-get --assume-yes install p7zip-full p7zip-rar

cd 
mkdir anki
cd anki
wget https://apps.ankiweb.net/downloads/current/anki-2.0.47-amd64.tar.bz2
tar xjf anki-2.0.47-amd64.tar.bz2
cd anki-2.0.47
sudo make install
cd

sudo apt-get --assume-yes install qbittorrent;

sudo add-apt-repository -y ppa:unit193/encryption
sudo apt update
sudo apt --assume-yes install veracrypt

sudo apt-get --assume-yes install bleachbit
echo "-------------------- Flash  -------------------- "; 
sudo apt-get --assume-yes install flashplugin-installer; 


echo "-------------------- Bluetooth -------------------- "; 
sudo apt-get --assume-yes install blueman

# git initial config
git config --global user.email "piotoor@gmail.com"
git config --global user.name "Piotr Kozka"

