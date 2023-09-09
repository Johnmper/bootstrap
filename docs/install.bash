#!/usr/bin/env bash

SCRIPTPATH="$(
  cd -- "$(dirname "$0")" > /dev/null 2>&1
  pwd -P
)"


# sudo sh <(curl -L https://nixos.org/nix/install) --daemon --yes
# . ${HOME}/.nix-profile/etc/profile.d/nix.sh

# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update

# nix-shell '<home-manager>' -A install


HOME_MANAGER_CONFIG="${HOME}/.config/home-manager/home.nix"
if [ -f "${HOME_MANAGER_CONFIG}" ]; then
  echo "Found existing Home Manager config. Removing"
  rm "${HOME_MANAGER_CONFIG}"
fi
ln -s ${SCRIPTPATH}/nix/home.nix ${HOME_MANAGER_CONFIG}
