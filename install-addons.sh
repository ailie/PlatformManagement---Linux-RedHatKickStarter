relCallingPath=`dirname "$0"`

echo


    # Install extra desktopLaunchers
if [ -d "$relCallingPath/DesktopLaunchers/" ]; then
    dst='/usr/share/applications/userInstalled/'
    mkdir -p "$dst" && cp -rt "$dst" "$relCallingPath/DesktopLaunchers"/*
else
  echo "Can't find any extra DESKTOPLAUNCHERS to install..."
fi


    # Install extra fonts
if [ -d "$relCallingPath/Fonts/" ]; then
    dst='/usr/share/fonts/userInstalled/'
    mkdir -p "$dst" && cp -rt "$dst" "$relCallingPath/Fonts"/*
else
  echo "Can't find any extra FONTS to install..."
fi


    # Install extra icons
if [ -d "$relCallingPath/Icons/" ]; then
    dst='/usr/share/icons/userInstalled/'
    mkdir -p "$dst" && cp -rt "$dst" "$relCallingPath/Icons"/*
else
  echo "Can't find any extra ICONS to install..."
fi


    # Install extra sounds
if [ -d "$relCallingPath/Sounds/" ]; then
    dst='/usr/share/sounds/userInstalled/'
    mkdir -p "$dst" && cp -rt "$dst" "$relCallingPath/Sounds"/*
else
  echo "Can't find any extra SOUNDS to install..."
fi


    # Install extra wallpapers
if [ -d "$relCallingPath/Wallpapers/" ]; then
    dst='/usr/share/wallpapers/userInstalled/'
    mkdir -p "$dst" && cp -rt "$dst" "$relCallingPath/Wallpapers"/*
else
  echo "Can't find any extra WALLPAPERS to install..."
fi
