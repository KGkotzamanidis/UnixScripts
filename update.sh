#!/usr/bin/env bash
version="0.0.1"

function show_error()
{
	local msg="${1}"
	echo "${msg}"
	exit 1
}

function check_root()
{
	if [ "$(id -u)" != "0" ]; then
	show_error "Error! You must execute the script as the 'root user."
	fi
}

function check_sudo()
{
	if [ ! -n ${SUDO_USER} ]; then
	show_error "Error! You must invoke the script using 'sudo."
	fi
}
check_root
check_sudo

echo "<<Starting Full System check>>"
echo "Script Version:$version"
echo "[X]Fix broken package"
dpkg --configure -a
echo "[X]Update Source"
apt-get update
echo "[X]Install Updates"
apt-get -f install
echo "[X]Install Upgrades"
apt-get -y upgrade
echo "[X]Auto remove packages"
apt-get autoremove
echo "[X]Clean up system"
apt-get autoclean
