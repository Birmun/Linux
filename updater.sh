#!/bin/bash
# This is a simple update script for Debain based Linux systems.

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED='\e[1;31m'

sudo apt update
echo -e $TEXT_YELLOW
echo 'update completed'
echo -e $TEXT_RESET

sudo apt full-upgrade -y
echo -e $TEXT_YELLOW
echo 'full system upgrade completed'
echo -e $TEXT_RESET

sudo apt autoremove -y
echo -e $TEXT_YELLOW
echo 'autoremove completed'
echo -e $TEXT_RESET

sudo apt autoclean
echo -e $TEXT_YELLOW
echo 'cleaning completed'
echo -e $TEXT_RESET

sudo updatedb
echo -e $TEXT_YELLOW
echo 'file database updated'
echo -e $TEXT_RESET

# This part asks You to reebot the system after signifcant update changes have been made.
# -t 1 is a minute wait before shutdown

if [ -f /var/run/reboot-required ]; then
echo -e $TEXT_RED
read -p "Do You want to reboot the system now? [y/N] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo -e $TEXT_RESET
shutdown -r -t 1
fi
