#!/bin/bash

#sudo apt-get update;

echo "-------------------- Downloading music related apps -------------------- ";
sudo apt-get --assume-yes install banshee;

echo "-------------------- Downloading video related apps -------------------- ";
sudo apt-get --assume-yes install smplayer;
sudo apt-get --assume-yes install qnapi;
sudo apt-get install vlc browser-plugin-vlc

echo "-------------------- Downloading image browsers and editors -------------------- ";
sudo apt-get --assume-yes install gthumb;

echo "-------------------- Downloading development stuff -------------------- ";
sudo apt-get --assume-yes install git;
sudo apt-get --assume-yes install vim;
sudo apt-get --assume-yes install tree;

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

echo "-------------------- Downloading communicators -------------------- ";
sudo apg-get --assume-yes install kadu;

echo "-------------------- Downloading java -------------------- ";
sudo apt-get --assume-yes install default-jre;
sudo apt-get --assume-yes install default-jdk;
 
echo "-------------------- Other apps -------------------- ";
sudo apt-get --assume-yes install anki;
sudo apt-get --assume-yes install gimp;
sudo apt-get --assume-yes install qbittorrent;

echo "-------------------- Flash  -------------------- "; 
sudo apt-get --assume-yes install flashplugin-installer; 
