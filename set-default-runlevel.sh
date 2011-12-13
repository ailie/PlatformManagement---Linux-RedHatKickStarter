### Set the final booting target (runlevel)

echo -e "\nSetting the final booting target/runlevel..."
ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target
