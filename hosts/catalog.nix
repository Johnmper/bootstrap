{ system, users }:
{
  prestige = {
    hostname = "prestige";
    system = system.x86_64-linux;
    config = ./prestige/configuration.nix;
    hardware = ./prestige/hardware.nix;
    users = [
      users.johnmper
    ];
  };

  # TODO
  desktop = {
    hostname = "desktop";
    system = system.x86_64-linux;
    config = ./desktop/configuration.nix;
    hardware = ./desktop/hardware.nix;
    users = [
      users.johndoe
    ];
  };

  # TODO
  virtualbox = {
    hostname = "virtualbox";
    system = system.x86_64-linux;
    config = ./virtualbox/configuration.nix;
    hardware = ./virtualbox/hardware.nix;
    users = [
      users.johndoe
    ];
  };
}
