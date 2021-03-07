# CROSTINI KDE SETUP #
### Purpose ###
KDE apps tend to not work ideally on Chromebook Linux (Beta) (a.k.a., Crostini) unless certain KDE environment variables are set.
Doing so is a bit tricky and undocumented, and this script automates the basic KDE environment setup.
Once KDE is setup from the Terminal, you can run **Discover** from the Chromebook Launcher to add/remove more Linux applications.

Additionally, the setup script installs these core KDE apps that can be launched from you Chromebook launcher:
* **Dolphin** - a file manager including SFTP enabling you to manage the local and remote file systems.
* **Konsole** - a terminal application with profiles to use locally and for SSH session to remote systems.
* **Kate** - an text editor with programming support for many languages.
* **Okular** - a document viewier that handles PDFs, E-books, and many more document formats.

*Note: this script has been tested on Chromebook v88.*


### Instructions ###

1. In the Chromebox settings, enable Linux (Beta) (the default 7.5G size is OK). See [Set up Linux (Beta) on Your Chromebook](https://support.google.com/chromebook/answer/9145439?p=chromebook_linuxapps&b=hatch-signed-mp-v6keys&visit_id=637506510150436611-3956044416&rd=1)
1. After enabling Linux (Beta), a "Terminal" will open;  then enter these commands (one per line):
	* `git clone https://github.com/joedefen/crostini-kde-setup.git`
	* `bash crostini-kde-setup/kde-setup.sh`
		* *Note: to enter the commands, you may copy each line in Chrome and right-click within the Terminal to paste, saving typing and avoiding typos.*
1. After the script completes (and it will take 10 minutes or so), find your installed Linux apps in the 'Linux app' folder of your Chromebook App Drawer.
1. In Terminal, optionally remove the install script by running:
	* `rm -rf ~/crostini-kde-setup`
1. Launch **Discover** to browse for available apps, install apps, launch installed apps, and remove unwanted apps.

### Additional Notes ###
* **Beware of Beta Software**.  Linux (Beta) has many bugs, although improving and already quite useful.
	* Sometimes the Linux container cannot be restarted; see [Moderators, can we get a pin on Error 51 and other Linux won't start situations?(Reddit)](https://www.reddit.com/r/Crostini/comments/ljdbck/moderators_can_we_get_a_pin_on_error_51_and_other/). So,
		* You may be able to set a flag (chrome://flags/#crostini-reset-lxd-db) to get it working.
		* If not reapairable, you may be able to recover any data.
		* The ultimate fix is to remove Linux (Beta) and (1) then renable it and do the setup or (2) restore from backup [Restore your Linux (Beta)](https://support.google.com/chromebook/answer/9592813?hl=en)
	* Protect yourself by doing regular backups (to an SD card if short on internal disk space).  See [Back up & restore your Linux (Beta) files and apps](https://support.google.com/chromebook/answer/9592813?hl=en)
* **You can vary UI settings.** The script establishes the Breeze Icon Theme.  After setup, from **Terminal** you can run `qt5ct` to vary some user interface settings.
* **Make your non-Linux files available to Linux.** From Chromebook Files, right click on "My Files", "Google Drive", and "SD Card" (if installed) and select "Share with Linux" to make each visible to Linux.
	* If visible to Linux in Dolphin, you may wish to create "Place" shortcuts to the file system locations:
		* **My Files** at `/mnt/chromeos/MyFiles`
		* **Google Drive** at `/mnt/chromeos/GoogleDrive/MyDrive`
		* **SD Card** at `/mnt/chromeos/removable/SD Card/`
* **Not every Linux app runs well.** You will find many Linux apps that **Discover** lists work fine, but certainly not all.
	* Sometimes the application will have settings that make it more useful (trying googling a solution).
	* If an application text and icons are too small, then launch it from the App Drawer (not Discover), right click on its icon in the Chromebook Shelf, select "Use Low Density", close the app, and restart the app.  If the appearance not more acceptable, revert the density choice.
	* You might find [KDE Apps](https://apps.kde.org/) the most aggreeable, but not all of them work well either.
	* Many popluar non-KDE apps work well, including **GIMP**, **Firefox**, **VLC**, **Thunderbird**, **Aisleriot Solitaire**, and **GNU Backgammon**.
