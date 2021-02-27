# CROSTINI KDE SETUP #
KDE apps tend to not render their icons on Crostini unless certain KDE environment variables are set.
Doing so is a bit tricky and undocumented.


### Purpose ###

After enabling Linux on a Chromebook,run `kde-setup.sh` to setup the KDE program environment and install:

* **Discover** - to add more apps.
* **qt5ct** - to establish the Breeze icon theme.
* **MenuLibre** - to fix broken Chromebook App Drawer icons.

### Instructions ###

* In the Chromebox settings, enable Linux (the default 7.5G size is OK).
* Run `git clone https://github.com/joedefen/crostini-kde-setup.git`
* Run `bash crostini-kde-setup/kde-setup.sh`
* After the reboot, launch `Terminal` and run:
    * `qt5ct` and select/apply the Breeze icon theme.
    * `rm -rf crostini-kde-setup` to remove the downloaded script.
* Launch `Discover` to install more programs.
* As needed, use MenuLibre to fix broken Chromebook App Drawer icons.  For instructions, see https://www.reddit.com/r/Crostini/comments/kmxkih/an_easy_way_to_fix_the_penguin_icon_on_some_app
