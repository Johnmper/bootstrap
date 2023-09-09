# bootstrap

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

## Structure

```bash
nixconf/
├── docs/
├── dotfiles/
├── hardware/
│   ├── desktop/
│   └── virtualbox/
├── hosts/
│   ├── altermann/
│   │   ├── configuration.nix
│   │   ├── default.nix
│   │   └── home.nix
│   ├── homeserver/
│   │   ├── ...
│   └── default.nix
├── modules/
├── overlays/
├── packages/
├── flake.nix
└── flake.lock
```


- `docs`: Location where documentation can be found
- `dotfiles`: All the dotfiles that can be used by the configurations.
- `hosts`: Host specific configurations. One individual directory per host.
- `modules`: The NixOS modules what are to be used by the configurations.
- `overlays`: The Overlays to be used by the configurations.
- `packages`: Extra packages available to the configurations.
- `user`: The user specific setups.

