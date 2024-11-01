#!/bin/bash
#
#Creat by kangqull
ip44=$(curl -4 -s ipv4.webshare.io)

read -p " Apakah kamu mau merubah configurasi Windows: " enter

echo "Mematikan Windows...."
docker compose down
clear
echo "**************************************"
echo "*                                    *"
echo "*         List Windows kode          *"
echo "*         _________________          *"
echo "*                                    *"
echo "*  1.win11    6.win10e   11.winxp    *"
echo "*  2.ltsc11   7.win8                 *"
echo "*  3.win11e   8.win8e                *"
echo "*  4.win10    9.win7                 *"
echo "*  5.ltsc10   10.vista               *"
echo "*                                    *"
echo "*------------------------------------*"
echo "*                                    *"
echo "*           Windows Server           *"
echo "*           ______________           *"
echo "*                                    *"
echo "*  1.2025      5.2012                *"
echo "*  2.2022      6.2008                *"
echo "*  3.2019      7.2003                *"
echo "*  4.2016                            *"
echo "*                                    *"
echo "**************************************"

read -p "Masukan Kode windows: " win
clear
read -p "Membuat User login baru: " usr
clear
read -p "Membuat Password baru: " ps
clear
read -p "Masukan Size RAM: " ram
clear
read -p "Masukan berapa CPU: " cpu
clear
read -p "Masukan berapa DISK (example=100G): " disk
clear
read -p "Masukan Port tidak lebih dari angka 3389
         (example: 0 - 3389): " port
clear
echo "services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: $win
      REGION: en-US
      KEYBOARD: en-US
      USERNAME: $usr
      PASSWORD: $ps
      RAM_SIZE: $ram
      CPU_CORES: $cpu
      DISK_SIZE: $disk
    devices:
      - /dev/kvm
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - $port:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m "  > ~/compose.yml
echo "Memulai Windows..."
docker compose up -d
clear
echo "Login RDP baru dengan:"
echo "Username: $usr"
echo "Password: $ps"
echo "IP RDP: $ip44:$port"

echo 'Kembali kemenu dalam 12 detik'
sleep 12
clear
bash menu.sh
