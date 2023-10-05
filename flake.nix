{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, flake-utils, home-manager, ... }@inputs: 
    let 
      inherit (self) outputs;
      inherit (flake-utils.lib) system;
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;
      users = import ./users { inherit inputs outputs hosts nixpkgs homeManagerConfiguration; };
      hosts = import ./hosts { inherit inputs nixosSystem system users; };
    in {
      nixosConfigurations = hosts.allNixosConfigurations;
      homeConfigurations = users.allUserConfigurations;

      # homeConfigurations = builtins.mapAttrs (hostname: node:
      #   builtins.listToAttrs
      #     (builtins.map (user:
      #       nixpkgs.lib.nameValuePair "${user.username}@${hostname}" "${user.username}CONFIG"#users.configHomeManagerUser { config = user; username = user.username; system = node.system; };
      #     ) node.users
      #   )
      # ) hosts.catalog;

      # homeConfigurations = mapAttrs
      #  ( username: config:
      #     users.configHomeManagerUser { inherit username config; host = hosts.catalog.prestige; }
      #  ) users.catalog;
    };
}
