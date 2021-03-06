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

* In the Chromebox settings, enable Linux (Beta) (the default 7.5G size is OK). See [Set up Linux (Beta) on Your Chromebook](https://support.google.com/chromebook/answer/9145439?p=chromebook_linuxapps&b=hatch-signed-mp-v6keys&visit_id=637506510150436611-3956044416&rd=1)
* After enabling Linux (Beta), a "Terminal" will open;  then enter these commands (one per line):
	* `git clone https://github.com/joedefen/crostini-kde-setup.git`
	* `bash crostini-kde-setup/kde-setup.sh`
* *Note: to enter the commands, you may copy each line in Chrome and right-click within the Terminal to paste, saving typing and avoiding typos.*
* After the script completes (and it will take 10 minutes or so), find your installed Linux apps in the 'Linux app' folder of your Chromebook App Drawer.
* Launch **Discover** to browse for available apps, install apps, launch installed apps, and remove unwanted apps.

### Additional Notes ###
* The script establishes the Breeze Icon Theme.  After setup, from **Terminal** you can run `qt5ct` to vary some user interface settings.
* From Chromebook Files, right click on "My Files", "Google Drive", and "SD Card" (if installed) and select "Share with Linux" to make each visible to Linux.
* If visible to Linux in Dolphin, you may wish to create "Place" shortcuts to the file system locations:
	* **My Files** at `/mnt/chromeos/MyFiles`
	* **Google Drive** at `/mnt/chromeos/GoogleDrive/MyDrive`
	* **SD Card** at `/mnt/chromeos/removable/SD Card/`
* You will find many Linux apps that Discover lists work fine, but not all.
	* Sometimes the application will have settings that make it more useful.
	* If an application appears too "small", then launch it from the App Drawer (not Discover), right click on its icon in the Chromebook Shelf, select "Use Low Density", close the app, and restart the app.  If the appearance not more acceptable, revert the density choice.
	* You might finde [KDE Apps](https://apps.kde.org/) the most aggreeable, but not all of them may work either.
	* Some popluar non-KDE apps that work well include **GIMP**, **Firefox**, **VLC**, **Thunderbird**, **Aisleriot Solitaire**, and **GNU Backgammon**.
