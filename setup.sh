ourRelLocation=`dirname "$0"`
ourAbsLocation=`cd "$(dirname "$0")" && pwd`

ourName=`basename "$0"`

baseArch=`uname -r | cut -d "." -f 6`
relsVers=`uname -r | cut -d "." -f 5` && relsVers=${relsVers#fc}

if [ $EUID = 0 ]; then
    chown -R root:root  "$ourAbsLocation"
    chmod -R 0644       "$ourAbsLocation"
    chmod -R a+X        "$ourAbsLocation"
else
    echo -e "\nFATAL: You need to be root. Exiting..." #&& exit
fi


#bash "$ourAbsLocation/cp.sh" "$ourAbsLocation/ConfigFiles/terminal" "/etc/profile.d/terminalCustomisations.sh"
#bash "$ourAbsLocation/cp.sh" "$ourAbsLocation/ConfigFiles/network" "/etc/sysconfig/network-scripts/ifcfg-staticIPv4"
bash "$ourAbsLocation/cp.sh" "$ourAbsLocation/ConfigFiles/desktop" "/etc/sysconfig/desktop"
mkdir /etc/fonts; bash "$ourAbsLocation/cp.sh" "$ourAbsLocation/ConfigFiles/fonts.local.conf" "/etc/fonts/local.conf"


if [ -d "$1" ]; then

  bash "$ourAbsLocation/install-repos.sh" "fedora-local" "$1"

else

  echo -e "\nusage: $ourName [path-to-your-locally-cached-repositories]"
  echo -e "\n  /path/to/your/locally/cached/repositories/"
  echo -e "  ├── Fedora-14-RPM-cache-x86_64/"
  echo -e "  ├── Fedora-15-RPM-cache-x86_64/"
  echo -e "  ├── Fedora-16-RPM-cache-x86_64/"
  echo -e "  └── Fedora-17-RPM-cache-x86_64/"

  echo -en "\nYou didn't specify any path to the repos pool; maybe you don't have any... Continue or e(x)it ? " && read
  if [ "$REPLY" = "x" ] || [ "$REPLY" = "X" ]; then exit; fi

  bash "$ourAbsLocation/install-repos.sh"

fi


bash "$ourAbsLocation/sw-update-some-software.sh"


### Check if we're running on a freshly booted system

echo -en "\nExit, update your system and reboot first! If you already did that, you may c(o)ntinue. " && read
if [ "$REPLY" != "o" ] && [ "$REPLY" != "O" ]; then exit; fi


bash "$ourAbsLocation/sw-install-some-software.sh"
bash "$ourAbsLocation/install-addons.sh"
bash "$ourAbsLocation/set-default-runlevel.sh"


echo -e "\nThat's all, reboot your system now !"
