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
      catalog = import ./catalog.nix { inherit system; };
      hosts = import ./hosts { inherit nixpkgs catalog inputs system; };
      users = import ./users { inherit nixpkgs catalog inputs outputs home-manager; };
    in {
      nixosConfigurations = hosts.allNixosConfigurations;
      homeConfigurations = users.allUserConfigurations;
    };
}
