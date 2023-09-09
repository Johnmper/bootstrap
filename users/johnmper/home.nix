{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "johnmper";
    homeDirectory = "/home/johnmper";
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    neovim.enable = true;
    jq.enable = true;
    bat.enable = true;
    bash.enable = true;
  };

  home.packages = with pkgs; [
    curl
    du-dust
    ripgrep
    vault
    nixpkgs-fmt
  ];

  systemd.user.startServices = "sd-switch"; # Reload services on switch
  home.stateVersion = "23.05"; # Check # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
