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
      catalog = import ./catalog.nix { inherit system; };
      users = import ./users { inherit catalog inputs outputs hosts nixpkgs homeManagerConfiguration; };
      hosts = import ./hosts { inherit catalog inputs nixosSystem system users; };
    in {
      nixosConfigurations = hosts.allNixosConfigurations;
      homeConfigurations = users.allUserConfigurations;
    };
}
