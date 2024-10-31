#!/bin/bash
#                                                                          # CREATED By  kangqull
#
echo "*******************************************"
echo "*                                         *"
echo "*     Daftar menu Menu yang kamu mau      *"
echo "*     ______________________________      *"
echo "*                                         *"
echo "* 1) Rubah Windows    3) Hapus windows    *"
echo "* 2) Matikan Windows  4) Nyalakan windows *"
echo "*                                         *"
echo "*******************************************"

read -p "Pilih menu [1]: " menus

case "$menus" in
        1) bash menu/rubah.sh
        ;;
        2) bash menu/matikan.sh
        ;;
        3) bash menu/hapus.sh
        ;;
        4) bash menu/nyalakan.sh
        ;;
        *) echo "pilihan salah"; exit;;
esac
