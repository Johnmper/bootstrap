# NixConfig

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

