# upgrade the software in the crostini container

apt_cros="/etc/apt/sources.list.d/cros.list"
os_ver=$(cat /dev/.cros_milestone)
cur_ver=$(sed -r 's!^(.*cros-packages/)([0-9]+)\b(.*)$!\2!' $apt_cros)

if [ "$os_ver" != "$cur_ver" ]; then
	sudo sed -i -E 's!^(.*cros-packages/)([0-9]+)\b(.*)$!\1'"${os_ver}"'\3!' $apt_cros
fi
sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove


