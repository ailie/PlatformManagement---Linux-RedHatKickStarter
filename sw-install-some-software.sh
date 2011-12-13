### Initialize the yum args list
    argArray=()


# Sound
    #argArray+=(soundconverter)

# Networking
    #argArray+=(net-tools)                # VirtualBox before v4.3.20: The host-only networking needs, on the host-side, this obsolete package (it provides deprecated networking tools like: ifconfig, route, etc)

# General
    argArray+=(git qgit)
    argArray+=(@^kde-desktop-environment khelpcenter kde-plasma-yawp kdeartwork kdeartwork-screensavers apper createrepo)
    argArray+=(digikam ufraw ufraw-gimp hugin)
    argArray+=(fsarchiver kde-partitionmanager gparted smartmontools cryptsetup)
    argArray+=(man-db bash-completion krusader mc tree pwgen)
    argArray+=(krename unrar filelight)
    argArray+=(nmap vsftpd fuse-sshfs)
    argArray+=(pidgin pidgin-libnotify)
    argArray+=(qbittorrent)
    argArray+=(youtube-dl ffmpeg vlc phonon-backend-vlc)
    argArray+=(xbmc libva-intel-driver)		# xbmc and its undeclared (ie runtime-evident) deps

# Storage devices: control and monitor
    argArray+=(smartmontools hdparm)

# Files: view, edit, compare
    argArray+=(meld kdiff3)			# diff-ers
    argArray+=(vbindiff dhex bless okteta)	# binary-file editors

# Tools for compiling kernel drivers
    argArray+=(dkms kernel-devel)

# Web browsing
    argArray+=(firefox mozilla-vlc)
    argArray+=(midori)
    argArray+=(qupzilla)
    #argArray+=(icedtea-web)

# Office suite
    # if on EL
	argArray+=(@office-suite)
    # else if on fedora
	argArray+=(@libreoffice)

# Fonts
    argArray+=(google-croscore-*-fonts)
    argArray+=(opendyslexic-fonts)

# Misc
    #argArray+=(PackageKit)
    #argArray+=(gscan2pdf)
    #argArray+=(thunderbird)
    #argArray+=(wine)
    #argArray+=(xorg-x11-server-Xorg xorg-x11-drivers)
    #argArray+=(xrdp remmina-plugins-rdp remmina-plugins-vnc)
    #argArray+=(chmsee kchmviewer fbreader-qt)
    #argArray+=(mysql-workbench)
    #argArray+=(qt-creator qt-doc)
    #argArray+=(java-1.7.0-openjdk-demo java-1.7.0-openjdk-devel java-1.7.0-openjdk-javadoc java-1.7.0-openjdk-src)

### Don't install this
    argArray+=(-@guest-agents -@guest-desktop-agents)
    argArray+=(-*koffice* -konqueror)
    #argArray+=(-pulseaudio -pulseaudio-gdm-hooks -pulseaudio-module-bluetooth -pulseaudio-module-x11 -pulseaudio-utils -kde-settings-pulseaudio -alsa-plugins-pulseaudio)	# removing pulseaudio may break Android SDK's emulator (high CPU usage and, maybe, no startup)


echo; yum -- install "${argArray[@]}"   # If any given package/group is prefixed with "-", a search is done within the transaction and any matches are removed. Yum options use the same syntax, so it may be necessary to use "--" to resolve any possible conflicts.


# Temp
    #yum install VirtualBox-4.3 mesa-libGL-devel libstdc++.i686
