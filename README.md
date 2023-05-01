# rtmc-ubuntu
## R Studio environment on Ubuntu

This is a Vagrant installation providing a virtual RStudio environment based on Ubuntu 22.04.2 Jammy Jellyfish. The motivation for this are the undergraduate courses for introductory statistics and R at the University of Helsinki, but anyone is naturally free to use it. It offers R version 4.3.0 and R Studio version 2023.03.0 Build 386. It runs on Windows, Mac and Linux hosts.

Requirements:
- 8 GB or more RAM
- Virtualisation support (modern processor)
- Git (optional)
- VirtualBox
- Vagrant

### Instructions

#### TL;DR

https://git-scm.com/download/

https://www.virtualbox.org/wiki/Downloads

https://www.vagrantup.com/downloads

```
git clone https://github.com/jzheinon/rtmc-ubuntu.git
cd rtmc-ubuntu
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-vbguest
vagrant up
```
Username: vagrant

Password: vagrant
#### Required software installation

Note that git is optional, you may also download the repository from GitHub as a zip file and extract it.

- Git (optional)
  - Linux: Install with your package manager
    ```bash
     sudo apt install git
     ``` 
    (Ubuntu / Debian)
    
    or
    ```bash
    sudo yum install git
    ```
    (Red Hat / CentOS / Fedora)
   - macOS: Install XCode from the App Store
   - Windows: Download from https://git-scm.com/download/win
- VirtualBox
   - Linux: Install with your package manager
    ```bash
     sudo apt install virtualbox
     ``` 
    (Ubuntu / Debian)
    
    or
    ```bash
    sudo yum install virtualbox
    ```
    (Red Hat / CentOS / Fedora)
 - Windows / macOS: Download from https://www.virtualbox.org/wiki/Downloads
 - Vagrant
   - Linux: Install with your package manager
    ```bash
     sudo apt install vagrant
     ``` 
    (Ubuntu / Debian)
    
    or
    ```bash
    sudo yum install vagrant
    ```
    (Red Hat / CentOS / Fedora)
 - Windows / macOS: Download from https://www.vagrantup.com/downloads

 #### Clone git repository

For instance in your home directory, run
```bash
git clone https://github.com/jzheinon/rtmc-ubuntu.git
```

#### Change directory and install plugins
```bash
cd rtmc-ubuntu
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-vbguest
```
#### Start installation
```bash
vagrant up
```
This will take a while, depending on your internet connection and system performance.

The username and password are both **vagrant**

When installing RTMC, create a directory for library_paths, e.g.
```bash
mkdir rlib
```
and in the installation script, set

library_paths <- "/home/vagrant/rlib"

Follow the instructions from RTMC installation. R and RStudio are installed automatically, so you may ignore those steps. In RTMC installation the packages will be installed from source, so it will take a while.

### Tips

#### Display
If your display has sluggish performance or experiences other problems, you may try changing the display manager to lightdm (in the virtual machine).
```bash
sudo dpkg-reconfigure lightdm
```

#### Keyboard
For Finnish keyboard layout, click the power button icon on the top right, click Settings->Keyboard, click the plus sign under "Input Sources", add Finnish and select it on the top menu.

#### Accessing applications

The application list is accessed from the bottom left. Apps of interest are **Terminal** (command line) and **RStudio**. Frequently used apps may be added permanently to the sidebar by right-clicking and adding them as favorites. R console may be started by typing

```bash
R
```

in the Terminal. You may run multiple tabs in one terminal and multiple terminal windows.