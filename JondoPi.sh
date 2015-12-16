#!/bin/bash
#JonDoPi v.1.0
#Forces Run As Root and Installs JondoConsole (Verifies)
#Adds Daemon to start at boot
#Needs Testing

if (( $EUID != 0 )); then
	/bin/echo "This script must be run as root. Type in 'sudo $0' to run it as root."
	exit 1
fi

/usr/bin/clear/
/bin/echo "Now installing JonDoConsole"

/usr/bin/apt-get install default-jre-headless java-wrappers rlwrap
/usr/bin/wget https://anonymous-proxy-servers.net/downloads/jondodaemon_all.deb
/usr/bin/wget https://anonymous-proxy-servers.net/downloads/jondodaemon_all.deb.asc
/usr/bin/gpg --verify jondodaemon_all.deb.asc

/usr/bin/clear

/usr/bin/echo "Settings Up Jondo Dependencies"
/usr/bin/dpkg -i jondodaemon_all.deb

/usr/bin/clear/
/usr/bin/echo "Setting JonDoConsole Daemon Use "

/usr/bin/clear/
/usr/bin/service jondodaemon start

/usr/bin/clear/

/usr/bin/"Setting Jondo Daemon To Start At Boot"
set -e
[ "$IFACE" != "lo" ] || exit 0
/etc/init.d/jondodaemon start

/bin/echo/clear
/usr/sbin/update-rc.d jondodaemon enable

/usr/bin/echo "JondoConsole Installed && Jondo Daemon Setup To Start At Boot"

exit
