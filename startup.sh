#!/bin/bash

#sudo apt-get update;

echo "-------------------- Downloading music related apps -------------------- ";
sudo apt-get --assume-yes install banshee;

echo "-------------------- Downloading video related apps -------------------- ";
sudo apt-get --assume-yes install smplayer;
sudo apt-get --assume-yes install qnapi;

echo "-------------------- Downloading image browsers and editors -------------------- ";
sudo apt-get --assume-yes install gthumb;

echo "-------------------- Downloading development stuff -------------------- ";
sudo apt-get --assume-yes install git;
sudo apt-get --assume-yes install vim;
sudo apt-get --assume-yes install tree;

echo "-------------------- Downloading communicators -------------------- ";
sudo apg-get --assume-yes install kadu;

echo "-------------------- Downloading java -------------------- ";
sudo apt-get --assume-yes install default-jre;
sudo apt-get --assume-yes install default-jdk;
 
echo "-------------------- Other apps -------------------- ";
sudo apt-get --assume-yes install anki;
sudo apt-get --assume-yes install gimp;
