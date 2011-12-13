src="$1"
dst="$2"

if [ -f "$dst" ]; then
  echo -e "\nWARNING: $dst"
  read -p "    This file already exists and will not be updated. [press ENTER to continue]"
else
  cp "$src" "$dst"
fi
