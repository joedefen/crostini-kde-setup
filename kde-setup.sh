#!/bin/bash

set -x

sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade

CONF=/etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
sudo tee -a $CONF >/dev/null <<'EOF'
Environment="QT_QPA_PLATFORMTHEME=qt5ct"
Environment="XDG_CURRENT_DESKTOP=KDE"
EOF

sudo apt -y install qt5ct menulibre breeze-icon-theme
sudo apt -y install --no-install-recommends plasma-discover

set +x
echo "FINISHED: rebooting in 5x ... return to run 'qt5ct' and set Breeze icon theme"
sleep 5
sudo reboot now
