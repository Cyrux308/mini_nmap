#!/bin/bash

########################################################
####                                                ####
####         ______                                 ####
####        / / ___|   _ _ __ _   ___  __           ####
####       / / |  | | | | '__| | | \ \/ /           ####
####    _ / /| |__| |_| | |  | |_| |>  <            ####
####   (_)_/  \____\__, |_|   \__,_/_/\_\           ####
####               |___/                            ####
####                                                ####
########################################################

load(){
  	load="Tunggu.... "
  	loading=${#load}
  	i=0
  	while((i<100)); do
    		n=$((i*loading / 100))
    		printf "\e[00;32m\r[%-${loading}s]\e[00m" "${load:0:n}"
    		((i += RANDOM%10))
    		sleep 0.1
  	done
    echo -e "\n"
}

loading(){
    echo -e "\n"
    bar="====================================="
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}

logo(){
	clear
	sleep 0.3
	echo " __  __ ___ _   _ ___   _   _ __  __    _    ____  "
	sleep 0.3
	echo "|  \/  |_ _| \ | |_ _| | \ | |  \/  |  / \  |  _ \ "
	sleep 0.3
	echo "| |\/| || ||  \| || |  |  \| | |\/| | / _ \ | |_) |"
	sleep 0.3
	echo "| |  | || || |\  || |  | |\  | |  | |/ ___ \|  __/ "
	sleep 0.3
	echo "|_|  |_|___|_| \_|___| |_| \_|_|  |_/_/   \_\_|    "
	echo ""
}

banner(){
	echo "=============================================="
	sleep 0.1
	echo ""
	echo "       Author : Cyrux"
	sleep 0.1
	echo "       Team  : Midnight Coders Team"
	sleep 0.1
	echo "       Web   : cyrux.c1.biz"
	sleep 0.1
	echo ""
	echo "=============================================="
}
#nmap
mulai(){
	read -p "masukan ip target : " ip
	echo "Proses Ini Memakan Waktu..."
	load
	nmap -sS -v -O $ip
}

peringatan(){
	echo "Tools Ini Hanya Untuk Melihat Port Yang Terbuka Saja!!!"
	echo "tools ini diambil dari data nmap!!!"
	echo "Jadi Anda Harus Menginstal NMAP Terlebih dahulu!!!"
}

pilihan(){
	echo ""
	echo "masukan pilihan anda : "
	read -p "
[1]. mulai
[2]. install Nmap Untuk pengguna Termux
[3]. exit
" pill #masukan pilihan anda

	if [ $pill = "1" ]; then
		clear
		logo
		banner
		mulai
		echo ""
		echo ""
		echo "Terimakasih telah menggunakan Tools Saya"
		sleep 0.3
		echo "./Cyrux"
	elif [ $pill = "3" ]; then
		echo "Terimakasih telah menggunakan Tools Saya"
		exit
	else
		echo "menginstall nmap....."
		pkg install nmap
		clear
		logo
		banner
		pilihan
	fi
}
clear
loading
clear
load
clear
logo
banner
read -p "Siapa Nama Anda ? " nama
echo "Selamat Datang Sayang $nama :)"
sleep 2
clear
logo
banner
peringatan
pilihan
#END