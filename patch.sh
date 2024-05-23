#!/bin/sh

dmenuver="5.3"

patchlist=$(while IFS= read -r patch; do
	printf '%s\n' "$patch"
done << EOF
dmenu-bar-height-5.2.diff
dmenu-xresources-alt-5.3-modified.diff
config-SCDF-5.3.diff
EOF
)

if ! [ -d "src/dmenu-${dmenuver}" ]; then
	printf '%s\n' "[ERR]: Missing sources, are you sure you extracted dmenu in the right location?"
	exit 1
fi

for patch in $patchlist; do
	echo "$patch"
	patch -d "src/dmenu-${dmenuver}" -i "../../Patches/$patch"

	if [ "$?" -ne 0 ]; then
		printf '%s\n' "[ERR]: Could not apply patch \`$patch\`, exiting!"
		exit 1
	fi
done
