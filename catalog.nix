{ system }:
rec {
  users = import ./users/catalog.nix {};
  hosts = import ./hosts/catalog.nix { inherit system users; };
}
