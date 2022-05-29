#!/bin/sh

RSTUDIO_VERSION="2022.02.2-485"

isInstalled() {
  if $(dpkg-query -Wf'${db:Status-abbrev}' "$1" 2>/dev/null | grep -q '^i')
  then
    return 0
  else
    return 1
  fi
}

installRStudio() {
  if isInstalled rstudio
  then
     echo "[vagrant] rstudio is already installed"
  else
     echo "[vagrant] Installing rstudio" 
     wget --progress=bar:force:noscroll -O /tmp/rstudio-${RSTUDIO_VERSION}-amd64.deb https://download1.rstudio.org/desktop/bionic/amd64/rstudio-${RSTUDIO_VERSION}-amd64.deb
     dpkg -i /tmp/rstudio-${RSTUDIO_VERSION}-amd64.deb
  fi
}


installRStudio
