# NixConfig

## Structure

```bash
nixconf/
├── docs/                           # Never up-to-date docs :)
├── dotfiles/                       # Configuration files
├── hosts/
│   ├── prestige/
│   │   ├── configuration.nix
│   │   └── hardware.nix
│   ├── homeserver/
│   │   ├── ...
│   ├── catalog.nix                 # Catalog of Hosts
│   └── default.nix
├── modules/                        # Custom modules for both NixOS and HomeManager
├── overlays/                       # Custom overlays
├── packages/                       # Custom package derivations
├── users/
│   ├── johnmper/
│   │   └── home.nix
│   ├── johndoe/
│   │   ├── ...
│   ├── catalog.nix                 # Catalog of users
│   └── default.nix
├── catalog.nix                     # Global Catalog
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

## How to use

### NixOS

```bash
# How to switch
sudo nixos-rebuild --flake .#<hostname> switch

# example for the prestige laptop
sudo nixos-rebuild --flake .#prestige switch
```

### Home Manager

```bash
# How to switch
home-manager --flake .#<username>@<hostname> switch

# Exmaple for the johnmper in the prestige laptop
home-manager --flake .#johnmper@prestige switch

# In case that are issue with conflict files (first time running) lets backup them as well
home-manager switch --flake .#johnmper@prestige -b backup
```
