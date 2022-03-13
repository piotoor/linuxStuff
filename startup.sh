#!/bin/env bash

usage () {
  echo "./startup.sh username ssh-key-name"
}

wait_for_key () {
  while [ true ]
  do
    read -t 3 -n 1
    if [ $? = 0 ]
    then
      return;
    else
      echo "Waiting for the key...";
    fi
  done
}

clone_repos () {
  echo "-------------------- Getting repos -------------------- ";
  cd /home/$1
  mkdir Repos
  cd Repos
  git clone git@github.com:piotoor/programmingCore.git
  git clone git@github.com:piotoor/linuxStuff.git
  git clone git@bitbucket.org:piotoor/speedcubingalgorithms.git
  git clone git@github.com:piotoor/ev3dev-printer.git
  git clone git@github.com:piotoor/sfmlRaycaster.git
  git clone git@github.com:piotoor/ruGroupAnalyser.git
  git clone git@github.com:piotoor/AdventOfCode2021
  cd
}

ssh_configuration () {
  echo "-------------------- ssh configuration -------------------- ";
  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
  ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts
  ssh-keygen -t ed25519 -C "piotoor@gmail.com" -f /home/$username/.ssh/$1
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/$1
  cat ~/.ssh/$1.pub | xclip
  echo "Paste the newly-generated public ssh key into github and bitbucket. Then press any key to proceed."
}

validate_user () {
  if id "$1" &>/dev/null
  then
    echo "User found. Proceeding..."
  else
    echo "User not found. Exiting..."
    exit 1
  fi
}

validate_args () {
  if [ $# -ne 2 ]
  then
    echo "2 arguments expected. Provided $#"
    usage
    exit 1
  fi
}

git_configuration () {
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
}

install_java () {
  echo "-------------------- Installing java -------------------- ";
  sudo apt-get --assume-yes install default-jre;
  sudo apt-get --assume-yes install default-jdk;
  sudo add-apt-repository -y ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get --assume-yes install java-common oracle-java8-installer
  sudo apt-get --assume-yes install oracle-java8-set-default
  source /etc/profile
}

install_video_players () {
  echo "-------------------- Installing video related apps -------------------- ";
  sudo apt-get --assume-yes install smplayer;
  sudo apt-get --assume-yes install qnapi;
  sudo apt-get --assume-yes install vlc browser-plugin-vlc;
}

install_browsers_and_editors () {
  echo "-------------------- Installing browsers and editors -------------------- ";
  sudo apt-get --assume-yes install gthumb;
  sudo apt-get --assume-yes install gimp;
  sudo apt-get --assume-yes install notepadqq
  sudo add-apt-repository ppa:libreoffice/ppa
  sudo apt-get update
  sudo apt-get --assume-yes install libreoffice
  sudo apt-get --assume-yes install chromium-browser

}

install_dev_stuff () {
  echo "-------------------- Downloading development stuff -------------------- ";
  sudo apt-get --assume-yes install build-essential;
  sudo apt-get --assume-yes install git;
  sudo apt-get --assume-yes install vim;
  sudo apt-get --assume-yes install tree;
  sudo add-apt-repository -y ppa:webupd8team/atom
  sudo apt update;
  sudo apt update;
  sudo apt -y install cmake
  sudo apt install software-properties-common apt-transport-https wget;
  cd /tmp
  wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
  cd -
  sudo apt -y install atom;

  sudo apt-get --assume-yes install codeblocks;
  sudo apt-get --assume-yes install sqlite3 libsqlite3-dev;
  sudo apt-get --assume-yes install python
  sudo apt-get --assume-yes install python3
  sudo apt-get --assume-yes install python-pip
  sudo apt-get --assume-yes install python-pip3
  sudo pip install numpy
  sudo apt-get --assume-yes install snap
  sudo snap install pycharm-community --classic
  sudo pip3 install virtualenv

  sudo apt-get --assume-yes install libc6-armel-cross libc6-dev-armel-cross
  sudo apt-get --assume-yes install binutils-arm-linux-gnueabi
  sudo apt-get --assume-yes install libncurses5-dev
  sudo apt --assume-yes install gcc-arm-linux-gnueabi
  sudo apt --assume-yes install g++-arm-linux-gnueabi
  sudo apt --assume-yes install codeblocks-contrib
  sudo apt-get --assume-yes install libsfml-dev
}

install_communicators () {
  echo "-------------------- Install communicators -------------------- ";
  sudo apt-get --assume-yes install kadu
  sudo snap install discord
  sudo snap install slack --classic
  sudo apt-get --assume-yes install zoom
}

install_3d_modelling_apps () {
  echo "-------------------- Install 3D modelling software -------------------- ";
  sudo add-apt-repository -y ppa:openscad/releases
  sudo apt-get update
  sudo apt-get --assume-yes install openscad
}

install_educational_apps () {
  echo "-------------------- Install educational apps -------------------- ";
  sudo apt-get update && sudo apt-get --assume-yes install p7zip-full p7zip-rar

  cd /tmp
  mkdir anki
  cd anki
  wget https://apps.ankiweb.net/downloads/current/anki-2.1.26-linux-amd64.tar.bz2
  tar xjf anki-2.1.26-linux-amd64.tar.bz2
  cd anki-2.1.26-linux-amd64
  sudo make install
  cd /home/$1
}

install_flash () {
  echo "-------------------- Install flash  -------------------- ";
  sudo apt-get --assume-yes install flashplugin-installer;
}

install_bluetooth_tools () {
  echo "-------------------- Install bluetooth stuff -------------------- ";
  sudo apt-get --assume-yes install blueman
}

install_security_and_backup_tools () {
  echo "-------------------- Install security & backups stuff -------------------- ";
  cd /tmp
  wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
  sudo dpkg -i nordvpn-release_1.0.0_all.deb
  sudo apt-get update
  sudo apt-get --assume-yes install nordvpn
  cd

  sudo apt --assume-yes install cryptsetup
  sudo apt-get --assume-yes install bleachbit
  sudo apt-get --assume-yes install rsync

  sudo apt-get --assume-yes install tor torbrowser-launcher
  torbrowser-launcher

}

install_other_stuff () {
  echo "-------------------- Install grub stuff -------------------- ";
  sudo apt-get install --assume-yes grub-imageboot

  echo "-------------------- Install other utilities -------------------- ";
  sudo apt-get --assume-yes install qbittorrent;
}

main () {
  validate_args "$@"
  validate_user $1
  username=$1

  sudo apt-get update;
  sudo apt-get upgrade

  install_java
  install_video_players
  install_browsers_and_editors
  install_dev_stuff
  install_communicators
  install_3d_modelling_apps
  install_educational_apps $username
  install_flash
  install_bluetooth_tools
  install_security_and_backup_tools
  install_other_stuff

  git_configuration
  ssh_configuration $2
  wait_for_key
  clone_repos $username
}

#-------------------------------------------------------------------------------------------------------------

main "$@"
