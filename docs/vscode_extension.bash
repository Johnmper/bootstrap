#! /usr/bin/env nix-shell
#! nix-shell -i bash -p curl jq unzip
# shellcheck shell=bash
set -eu -o pipefail
#
# Example:
# Run script with:
# | ./vscode_extension.bash "teabyii.ayu"
# | {
# |   # teabyii.ayu
# |   name = "ayu";
# |   publisher = "teabyii";
# |   version = "1.0.5";
# |   sha256 = "1visv44mizfvsysrdby1vrncv1g3qmf45rhjijmbyak2d60nm0gq";
# | }
#
EXTID="$1"
EXTOWNER=$(echo "$EXTID" | cut -d. -f1)
EXTNAME=$(echo "$EXTID" | cut -d. -f2)

# Create a tempdir for the extension download.
EXTTMP=$(mktemp -d -t vscode_exts_XXXXXXXX)

URL="https://$EXTOWNER.gallery.vsassets.io/_apis/public/gallery/publisher/$EXTOWNER/extension/$EXTNAME/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

# Quietly but delicately curl down the file, blowing up at the first sign of trouble.
curl --silent --show-error --retry 3 --fail -X GET -o "$EXTTMP/$EXTID.zip" "$URL"

# Unpack the file we need to stdout then pull out the version
VER=$(jq -r '.version' <(unzip -qc "$EXTTMP/$EXTID.zip" "extension/package.json"))
# Calculate the SHA
SHA=$(nix-hash --flat --base32 --type sha256 "$EXTTMP/$EXTID.zip")

# Clean up.
rm -Rf "$EXTTMP"
# I don't like 'rm -Rf' lurking in my scripts but this seems appropriate.

cat <<-EOF
{
  name = "$EXTNAME";
  publisher = "$EXTOWNER";
  version = "$VER";
  sha256 = "$SHA";
}
EOF
