#!/usr/bin/env bash
script_version="0.0.1"

function show_error()
{
	local msg="${1}"
	echo "${msg}"
	exit 1
}

function check_root_access()
{
	if [ "$(id -u)" != "0" ]; then
	show_error "Error! You must execute the script as the 'root user."
	fi
}

function check_sudo_command()
{
	if [ ! -n ${SUDO_USER} ]; then
	show_error "Error! You must invoke the script using 'sudo'."
	fi
}
check_root_access
check_sudo_command

echo "Welcome to Repair, Restore or Reinstall Grub 2"
echo "for Linux (Ububtu,Mint,Remix)"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "First give us the partision name to mounted!"
echo "for example :sda1"
read primary_partision

mount /dev/$primary_partision /mnt
mount --bind /dev /mnt/dev &&
mount --bind /dev/pts /mnt/dev/pts
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys

echo "The partistion has been mounted!"
chroot /mnt
echo "Now we are in /mnt "
echo "Please give us the root name partision"
echo "for example : sda"
read root_partision
echo "Starting repair grub2"
grub-install /dev/$root_partision
grub-install --recheck /dev/$root_partision
update-grub
echo "Grub2 repair has finish"
echo "Try to umount partision"
exit &&
umount /mnt/sys &&
umount /mnt/proc &&
umount /mnt/dev/pts &&
umount /mnt/dev &&
umount /mnt
echo "Umount has finish, your system is restarting.."
exit
