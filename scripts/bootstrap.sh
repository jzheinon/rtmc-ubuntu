#!/bin/sh

RSTUDIO_VERSION="2021.09.0-351"
CRAN_LATEST="impish"

isInstalled() {
  if $(dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i')
  then
    return 0
  else
    return 1
  fi
}

testAndInstall() {
   if isInstalled $1
   then
      echo "[vagrant] $1 is installed"
   else
      echo "[vagrant] Installing $1"
      DEBIAN_FRONTEND=noninteractive apt install $1 -y
   fi
}

update() {
  apt update
  apt upgrade -y
  testAndInstall linux-headers-$(uname -r)
} 

setMirror() {
  sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/fi.archive.ubuntu.com/g' /etc/apt/sources.list
}

installCranKey() {
  KEYFILE="/etc/apt/trusted.gpg.d/cran_ubuntu_key.asc"
  if [ -f $KEYFILE ]
  then
    echo "[vagrant] CRAN repository key is installed"
  else
    echo "[vagrant] Adding CRAN repository key"
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a $KEYFILE
  fi
}

addCranRepository() {
   echo "[vagrant] Adding CRAN repository"
   add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu ${CRAN_LATEST}-cran40/"
}

installRStudio() {
  if isInstalled rstudio
  then
     echo "[vagrant] rstudio is already installed"
  else
     echo "[vagrant] Installing rstudio" 
     wget --progress=bar:force:noscroll -O /tmp/rstudio-${RSTUDIO_VERSION}-amd64.deb https://download1.rstudio.org/desktop/bionic/amd64/rstudio-${RSTUDIO_VERSION}-amd64.deb
     dpkg -i /tmp/rstudio-2021.09.0-351-amd64.deb
  fi
}

installPrerequisites() {
   echo "[vagrant] Installing prerequisites"
   testAndInstall software-properties-common
   testAndInstall dirmngr
   testAndInstall libclang-dev
   testAndInstall libpq5
   testAndInstall libcurl4
   testAndInstall libxml2-dev
   testAndInstall libxkbcommon-x11-0
}

setMirror
update
testAndInstall dkms
installPrerequisites
testAndInstall virtualbox-guest-x11
testAndInstall xfce4
testAndInstall lightdm
testAndInstall firefox
installCranKey
addCranRepository
testAndInstall r-base
installRStudio
testAndInstall r-cran-shinyjs

