#!/usr/bin/env bash
clear
while true;do
echo ""
echo "This program is free software; you can redistribute it and/or modify"
echo "it under the terms of the GNU General Public License as published by"
echo "the Free Software Foundation; either version 2, or (at your option)"
echo "any later version."
echo ""
echo "his program is distributed in the hope that it will be useful,"
echo "but WITHOUT ANY WARRANTY; without even the implied warranty of"
echo "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the"
echo "GNU General Public License for more details."
echo ""
echo "You should have received a copy of the GNU General Public License"
echo "along with this program; if not, write to the Free Software"
echo "Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA"
echo "02111-1307, USA."
echo ""
echo "http://www.gnu.org/copyleft/gpl.html"
echo ""
echo "Yes(y) or No(n)"
read accept
case $accept in
	y)
	clear
	cd ~
	while true;do
	echo "Welcome to encrypt/decrypt shell by me"
	echo "[!]Warning all data will be saved in your home folder!"
	echo "For encrypt prese 1"
	echo "For decrypt press 2"
	echo "For exit press 0"
	read choice
	case $choice in
		0) 
		exit
		;;
		1) 
		clear
		echo "Encryption Category"
		echo "[X]Give us your Name"
		read name
		echo "[X]Give us the file path to encrypted!"
		read filepath
		echo "[X]Give us the email user to encrypt data"
		read publickeypath
		gpg --output "encrypt($name).gpg" --encrypt --recipient $publickeypath $filepath
		echo "[!]Encryption Done.The file saved as encrypt($name).gpg"
		exit
		;;
		2) 
		clear
		echo "Decryption Category"
		echo "[X]Give us the file path to decrypted!"
		read filepath
		gpg --output "decrypt" --decrypt $filepath
		echo "[!]Decryption Done.The file save as decrypt"
		exit
		;;
		*) 
		echo "Select 1 or 2"
		;;
	esac
	done
	;;
	n)
	exit
	;;
	*) 
	clear
	echo "To proceed select Y or N"
	echo ""
	;;
esac
done
