#!/usr/bin/env bash
  
sudo apt update;
CYAN='\033[0;36m'
NC='\033[0m'
## install nfs client
sudo apt install nfs-common -y;

## to optimise the NAS performance, we change concurrent NFS requests from 2 to 128
echo "options sunrpc tcp_slot_table_entries=128" >> /etc/modprobe.d/sunrpc.conf;
echo "options sunrpc tcp_max_slot_table_entries=128" >>  /etc/modprobe.d/sunrpc.conf;

## The following commands will mount your NAS to this ECS. Commands are copied from 
## > Your NFS console 
## > File System 
## > File System List 
## > Select the NAS you want to mount to 
## > Mounting use
## > At the bottom: Mount the file system to ECS
sudo mount -t nfs -o vers=3,nolock,proto=tcp,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 177d08483ed-rxe48.ap-southeast-2.nas.aliyuncs.com:/ /mnt
#df -h | grep aliyun

## Create a soft link from the mount folder to current folder "nas"
ln -s /mnt nas
ln -s /mnt /home/admin/nas
printf "${CYAN}You NAS system has been mounted to ./nas and /home/admin/nas${NC}\n";

