#!/usr/bin/env bash
  
CYAN='\033[0;36m'
NC='\033[0m'

## install jre and jdk
sudo apt install -y default-jre default-jdk
## install r
sudo apt install -y apt-transport-https software-properties-common;
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9;
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/';
sudo apt dist-upgrade;
sudo apt update;
sudo apt install -y r-base r-base-core r-recommended build-essential libssh-dev libgit2-dev libcurl4-gnutls-dev libxml2-dev libssl-dev libgdal-dev libproj-dev libgeos++-dev;

## install rstudio-server
sudo apt-get install gdebi-core;
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.1093-amd64.deb;
sudo gdebi rstudio-server-1.3.1093-amd64.deb;

## add user to rstudio-server
printf "${CYAN}------rstudio-server install complete------${NC}\n";
printf "${CYAN}${NC}\n";
printf "${CYAN}-------------------------------------------${NC}\n";
printf "${CYAN}------config rstudio-server login user-----${NC}\n";
printf "${CYAN}${NC}\n";
printf "${CYAN}-----configuring user password and info----${NC}\n";
printf "${CYAN}${NC}\n";
sudo adduser admin;
sudo adduser admin root;
sudo echo 'server-user=admin' >> /etc/rstudio/rserver.conf;
sudo rm -rf /var/log/rstudio-server;
sudo rm -rf /var/lib/rstudio-server;
sudo rm -rf /tmp/rstudio-rsession;
sudo rm -rf /tmp/rstudio-rserver;
sudo rstudio-server restart;
printf "${CYAN}${NC}\n";
printf "${CYAN}----Your rstudio-server has been set up----${NC}\n"
printf "${CYAN}${NC}\n";
printf "${CYAN}Please make sure your server has an ip and accesible from your remote ip.${NC}\n"
printf "${CYAN}You can connect rstudio-server on browser at http://[server ip]:8787${NC}\n"
printf "${CYAN}use the username \'admin\' passwd we just created to login.${NC}\n"
printf "${CYAN}${NC}\n";
printf "${CYAN}To access admin through ssh, in root user run:  sudo su - admin${NC}\n";
printf "${CYAN}${NC}\n";
