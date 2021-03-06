#!/bin/bash
# NOTE: this scripts hides apps from Crostini temporarily and then makes them
# visible.  This sometimes fixes screwed up Crostini applications.
# Do not interrupt this script.
trap '{ echo "Caught Ctrl-C ... but ignoring"; sleep 5; }' INT
set -x
sudo mv /usr/share/applications /usr/share/applications.tmp
sleep 5
sudo mv /usr/share/applications.tmp /usr/share/applications
