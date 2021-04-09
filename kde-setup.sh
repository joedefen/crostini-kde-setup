#!/bin/bash

HERE=$(dirname $(realpath $0))
BIN=~/.local/bin

set -x

mkdir -p $BIN
for x in maint-gui maint-cli; do
    ln -f $HERE/$x $BIN/.
done
MaintGUI=$(realpath $BIN/maint-gui)

bash $BIN/maint-cli update-linux

CONF=/etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
sudo tee -a $CONF >/dev/null <<'EOF'
Environment="QT_QPA_PLATFORMTHEME=qt5ct"
Environment="XDG_CURRENT_DESKTOP=KDE"
EOF

sudo apt -y install apt-utils
sudo apt -y install qt5ct breeze-icon-theme ttf-dejavu
sudo apt -y install --no-install-recommends plasma-discover
xdg-icon-resource install --size 256 /usr/share/icons/Adwaita/256x256/apps/system-file-manager.png
xdg-icon-resource install --size 256 /usr/share/icons/Adwaita/256x256/apps/system-software-update.png
xdg-icon-resource install --size 256 /usr/share/icons/Adwaita/512x512/apps/utilities-terminal.png
sudo apt -y install dolphin konsole kate okular geany
sudo apt -y install --no-install-recommends python3-pip python3-tk
sudo pip3 install PySimpleGUI
sudo apt -y autoremove

if [ ! -f ~/.vimrc ]; then
    cat > ~/.vimrc <<EOF
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
EOF
fi


mkdir -p ~/.local/share/applications
cat >~/.local/share/applications/MaintGUI.desktop <<EOF
[Desktop Entry]
Name=MaintGUI
Comment=Update Linux
Exec=${MaintGUI}
Terminal=false
Type=Application
Icon=system-software-update
EOF

mkdir -p ~/.local/share/konsole
cat > ~/.local/share/konsole/LocalHost.profile <<'EOF'
[Appearance]
ColorScheme=BlackOnLightYellow
Font=DejaVu Sans Mono,12,-1,5,50,0,0,0,0,0,Book

[General]
Name=LocalHost
Parent=FALLBACK/
EOF

mkdir -p ~/.config
cat > ~/.config/konsolerc <<'EOF'
[Desktop Entry]
DefaultProfile=LocalHost.profile
EOF


mkdir -p ~/.config/qt5ct
cat > ~/.config/qt5ct/qt5ct.conf <<'EOF'
[Appearance]
color_scheme_path=/usr/share/qt5ct/colors/airy.conf
custom_palette=false
icon_theme=breeze
standard_dialogs=default
style=Fusion

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x16\0\x44\0\x65\0j\0\x61\0V\0u\0 \0S\0\x61\0n\0s@(\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\x16\0\x44\0\x65\0j\0\x61\0V\0u\0 \0S\0\x61\0n\0s@(\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
menus_have_icons=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3

[SettingsWindow]
geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x2\0\0\0\0\x2\xbb\0\0\x1\x13\0\0\x5\x99\0\0\x3\x9c\0\0\x2\xbb\0\0\x1\x13\0\0\x5\x99\0\0\x3\x9c\0\0\0\0\0\0\0\0\bP)
EOF

set +x
echo "FINISHED: please restart Linux manually..."
