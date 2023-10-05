{ system, users }:
{
  prestige = {
    hostname = "prestige";
    system = system.x86_64-linux;
    config = ./prestige/configuration.nix;
    hardware = ./prestige/hardware.nix;
    users = [
      users.catalog.johnmper
    ];
  };

  desktop = {
    hostname = "desktop";
    system = system.x86_64-linux;
    config = ./prestige/configuration.nix;
    hardware = ./prestige/hardware.nix;
    users = [
      users.catalog.johnmper
      users.catalog.johndoe
    ];
  };
}
