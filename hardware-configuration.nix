{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/89cf7a18-f63e-47c1-a3fa-d851bd03415b";
    fsType = "ext4";
  };

  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest = {
    enable = true;
    x11 = true;
  };
}
