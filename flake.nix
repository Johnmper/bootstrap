{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
    let 
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.virtualbox = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];
      };
      homeConfigurations = {
        johnmper = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./users/johnmper/home.nix];
        };
      };
      johnmper = self.homeConfigurations.johnmper.activationPackage;
      defaultPackage.x86_64-linux = self.johnmper;

      deploy = {
        sshUser = "root";
        user = "root";

        autoRollback = false;
        magicRollback = false;

        nodes = {
          virtualbox = {
            hostname = "192.168.1.6";
            profiles.system = {
              path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.virtualbox;
            };
          };
        };
      };
    };
}
