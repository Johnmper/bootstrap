# Notes

The linux user setup based on home-manager

## Setup

### Install Nix

```bash
# ChecK: https://nixos.org/download.html
# Or simply run:
sudo sh <(curl -L https://nixos.org/nix/install) --daemon --yes

# Make sure you restart your shell or run this command
. ${HOME}/.nix-profile/etc/profile.d/nix.sh
```

### Install Home Manager

```bash
# Add the home manager channel
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# Actually install the home manager
nix-shell '<home-manager>' -A install
```