{ catalog, inputs, nixpkgs, system }:
rec {
  configNixosHost = { hostname, node }:
    nixpkgs.lib.nixosSystem {
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
  ) catalog.hosts;
}
