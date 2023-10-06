{ catalog, inputs, outputs, nixpkgs, home-manager }:
rec {
  configHomeManagerUser = { system, username, config }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = inputs // {
        self = config;
        inherit outputs catalog username;
      };
      modules = [
        config.home
      ];
    };
  allUserConfigurations = nixpkgs.lib.lists.foldl (a: b: a // b ) {}
    (nixpkgs.lib.mapAttrsToList(hostname: node:
      builtins.listToAttrs
        (builtins.map (user:
          nixpkgs.lib.nameValuePair "${user.username}@${hostname}" (configHomeManagerUser { config = user; username = user.username; system = node.system; })
        ) node.users
      )
    ) catalog.hosts );
}
