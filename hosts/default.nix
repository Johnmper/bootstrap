{ inputs, nixosSystem, system, users }:
rec {
  catalog = import ./catalog.nix { inherit system users; };
  configNixosHost = { hostname, node }:
    nixosSystem {
      system = node.system;
      specialArgs = inputs // {
        self = node;
        inherit catalog hostname;
      };
      modules = [
        node.config
        node.hardware
      ];
    };
  allNixosConfigurations = builtins.mapAttrs (hostname: node:
    configNixosHost { inherit hostname node; }
  ) catalog;
}
