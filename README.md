# CROSTINI KDE SETUP #
### Purpose ###
KDE apps work best on Chromebook Linux (Beta) (a.k.a., Crostini) if certain KDE environment variables are set.
Doing so is a bit tricky and undocumented, and this script automates the basic KDE environment setup.
Once KDE is setup from the Terminal, you can launch:
* **Discover** from the Chromebook Launcher to add/remove more Linux applications.
* **MaintGUI** for most maintenance needs (described below).

Additionally, the setup script installs these core KDE apps that can be launched from you Chromebook launcher:
* **Dolphin** - a file manager including SFTP enabling you to manage the local and remote file systems.
* **Konsole** - a terminal application with profiles to use locally and for SSH session to remote systems.
* **Okular** - a document viewier that handles PDFs, E-books, and many more document formats.
* **Kate** - an text editor with programming support for many languages.
* **Geany** - an alternative lightweight text editor.
    * Unlike **Kate**, **Geany** can be run with sudo (e.g., to edit system files with a GUI editor)
    * To run a sudo'ed GUI app, like, **Geany**, from Terminal, first run `xhost +` on a separate line.

*Note: this script has been tested on Chromebook v88 and v89.*


### Installation Instructions ###

1. In the Chromebox settings, enable Linux (Beta) (the default 7.5G size is OK). See [Set up Linux on Your Chromebook](https://support.google.com/chromebook/answer/9145439?p=chromebook_linuxapps&b=hatch-signed-mp-v6keys&visit_id=637506510150436611-3956044416&rd=1)
1. After enabling Linux (Beta), a "Terminal" will open;  then enter these commands (one per line):
	* `git clone https://github.com/joedefen/crostini-kde-setup.git`
	* `bash crostini-kde-setup/kde-setup.sh`
		* *Note: to enter the commands, you may copy each line in Chrome and right-click within the Terminal to paste, saving typing and avoiding typos.*
1. After the script completes (and it will take 10 minutes or so), **restart your container** (i.e., *right-click* the Terminal icon on the shelf and select *Shut down Linux*; then launch *Terminal* again).
1. In Terminal, optionally remove the install script by running:
	* `rm -rf ~/crostini-kde-setup`
3. Find your installed Linux apps in the 'Linux app' folder of your Chromebook App Drawer (or type its name, e.g., "Discover", into the Launcher search dialog and hit return when it is first or click its icon).
4. In particular, launch **Discover** to browse for available apps, install apps, launch installed apps, and remove unwanted apps.
5. After every Chromebook update (which occur about monthly), we suggest you launch **MaintGUI** and click **Update Linux** to ensure your container is running the most aggreeable software for your Chromebook).

### MaintGUI Instructions ###

Launch **MaintGUI** for most maintenance needs which has these buttons:
* **Update Linux** - updates your Linux and its software which you should run periodically
  and after Chromebook major version updates.
* **Refresh Icons** - repairs icons for linux apps when messed up.
* **Enable Flatpak** - enables **Discover** flatpak app installs from the default flatpak repository
	* NOTE: that snaps do not work so well yet on Crostini and thus not yet enabled with this tool
* **Cleanup Flatpak** - recovers disk space after uninstalling flatpak apps (which Discover does not do automatically)
* **Disable LibreOffice File Locking** - for LibreOffice to work on Google Drive, after installing LibreOffic, run  this to *partly* disable its incompatible file locking. You must also:
    * be on a relatively up-to-date version of LibreOffice (e.g., via change Debian repository to **Unstable**.)
    * in LibreOffice's Tools > Options > LibreOffice > Advanced > Open Expert Configuration, set:
        * *UseLocking* to false
        * *UseDocumentOOoLockFile* to false
* For changing the Debian repository (from initially **Stable**):
    * **Testing** - newer, less stable software; you cannot to return to **Stable**.
    * **Unstable** - newest, least stable software; you may not be able
      to return to **Testing** and cannot return to **Stable**.

Debian is famous for lagging behind the bleeding edge, but **MaintGUI** can change the Debian flavor:
* remain on **Stable** unless you require more current apps.
* you are initially on Debian **Stable** after enabling Linux; if you leave **Stable**,
  you can return only by re-creating Linux or restoring a backup of Linux when on **Stable**.
* before leaving **Stable**, install every app you anticipate needing to minimize the odds of failing to install afterwards.
* before changing repository, backup Linux as a precaution
  (or accept the possibility you must re-install Linux).
* when changing respository, watch for errors and, and on failure, choose another
  until one succeeds (or restore a known good backup image).
* upgrading to **Unstable** is typically a better choice than **Testing**;  use **Testing** only if
  experimentally, you find it works best for your apps.

### Additional Notes ###
* **Beware of Linux Issues**.  Linux has bugs, although continually improving and already quite useful.
	* Sometimes the Linux container cannot be restarted; see [Moderators, can we get a pin on Error 51 and other Linux won't start situations?(Reddit)](https://www.reddit.com/r/Crostini/comments/ljdbck/moderators_can_we_get_a_pin_on_error_51_and_other/). So,
		* You may be able to set a flag (chrome://flags/#crostini-reset-lxd-db) to get it working.
		* If not repairable, you may not be able to recover your data.
		* The last restort fix is to remove Linux (Beta) and (1) then renable it and do the setup or (2) restore from backup [Restore your Linux (Beta)](https://support.google.com/chromebook/answer/9592813?hl=en)
	* Protect yourself by doing regular backups (to an SD card if short on internal disk space) if you store anything of importance or difficult to re-create within your container.  It is best practice to store documents in your Chromebook's "My Files" (or even better, "Google Drive", not in your containter home directory.  But, if backup is prudent, see [Back up & restore your Linux (Beta) files and apps](https://support.google.com/chromebook/answer/9592813?hl=en)
* **You can vary UI settings.** The script establishes the Breeze Icon Theme.  After setup, from **Terminal** you can run `qt5ct` to vary some user interface settings.
* **Change Terminal Settings.** If you wish to customize the terminal (e.g., change colors), then type CTRL-SHIFT-P in the Terminal window to get the Settings popup window.
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
