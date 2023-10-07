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
  # Since NMD seems to have been down for a while, lets deativate manpages for the home-manager
  manual.manpages.enable = false;
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
    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "johnmper";
      userEmail = "joaomgper94@gmail.com";
      difftastic = {
        enable = true;
        display = "side-by-side-show-both";
      };
    };
    git-cliff.enable = true;
    ssh.enable = true;
    tmux = {
      enable = true;
      terminal = "tmux-256color";
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      enableExtensionUpdateCheck = false;
      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Generated with nix/vscode_extension.bash "<extension-id>"
        {
          # teabyii.ayu
          name = "ayu";
          publisher = "teabyii";
          version = "1.0.5";
          sha256 = "1visv44mizfvsysrdby1vrncv1g3qmf45rhjijmbyak2d60nm0gq";
        }
        {
          # StackBuild.bazel-stack-vscode
          name = "bazel-stack-vscode";
          publisher = "StackBuild";
          version = "1.9.8";
          sha256 = "1y826zbi6jzga6siw6whw47v1cqv394xmix0pa5miamm1cfpwcpc";
        }
        {
          # arrterian.nix-env-selector
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "1.0.9";
          sha256 = "0kdfhkdkffr3cdxmj7llb9g3wqpm13ml75rpkwlg1y0pkxcnlk2f";
        }
        {
          # esbenp.prettier-vscode
          name = "prettier-vscode";
          publisher = "esbenp";
          version = "10.1.0";
          sha256 = "01s0vi2h917mqfpdrhqhp2ijwkibw95yk2js0l587wvajbbry2s9";
        }
        {
          # tamasfe.even-better-toml
          name = "even-better-toml";
          publisher = "tamasfe";
          version = "0.19.2";
          sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
        }
        {
          # pnp.polacode
          name = "polacode";
          publisher = "pnp";
          version = "0.3.4";
          sha256 = "0l9cm4jrjjrgrsqc0n0awi0xbgyk4sp08pddw5bnfnrsxwhs0kmv";
        }
        {
          # ms-azuretools.vscode-docker
          name = "vscode-docker";
          publisher = "ms-azuretools";
          version = "1.26.0";
          sha256 = "0fsmyxi0iwr0qr9fl86hsfqw8qlj3s9dzp25smx778zcvqxwlha6";
        }
        {
          # yzhang.markdown-all-in-one
          name = "markdown-all-in-one";
          publisher = "yzhang";
          version = "3.5.1";
          sha256 = "04b8hiha6z7w189lkx0lhy0sgldrfwx1yikl2463lkhhkm3f8av7";
        }
        {
          # kamikillerto.vscode-colorize
          name = "vscode-colorize";
          publisher = "kamikillerto";
          version = "0.11.1";
          sha256 = "1h82b1jz86k2qznprng5066afinkrd7j3738a56idqr3vvvqnbsm";
        }
        {
          # alefragnani.Bookmarks
          name = "Bookmarks";
          publisher = "alefragnani";
          version = "13.4.1";
          sha256 = "0ar82rxafdy4wg60c45w1n9iq60ysx5zl8j5bs7hmmp3wfhzjnih";
        }
        {
          # jnoortheen.nix-ide
          name = "nix-ide";
          publisher = "jnoortheen";
          version = "0.2.2";
          sha256 = "1264027sjh9a112si0y0p3pk3y36shj5b4qkpsj207z7lbxqq0wg";
        }
      ];
      userSettings = {
        "window.commandCenter" = true;
        "editor.fontSize" = 12;
        "editor.fontLigatures" = false;
        "editor.fontFamily" = "'Cascadia Code', 'Consolas', 'Courier New', monospace";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "terminal.external.linuxExec" = "xterm256-color";
        "terminal.integrated.scrollback" = 10000;
        "terminal.integrated.fontFamily" = "'Cascadia Code', 'Consolas', 'Courier New', monospace";
        "terminal.integrated.fontSize" = 12;
        "terminal.integrated.defaultProfile.linux" = "bash (container default)";
        "workbench.colorTheme" = "Ayu Mirage Bordered";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.startupEditor" = "none";
        # Extensions
        "bookmarks.navigateThroughAllFiles" = false;
      };
      keybindings = [
        {
          key = "ctrl+shift+m";
          command = "bookmarks.toggleLabeled";
          when = "editorTextFocus";
        }
        {
          key = "ctrl+shift+g m";
          command = "bookmarks.list";
        }
      ];
    };
    kitty = {
      enable = true;
      theme = "Ayu Mirage";
      settings = {
        scrollback_lines = 100000;
        enable_audio_bell = false;
        update_check_interval = 0;
      };
      shellIntegration.enableBashIntegration = true;
    };
    jq.enable = true;
    bat.enable = true;
    bash.enable = true;
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
      edge-scrolling-enabled = false;
      natural-scroll = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "suspend";
      idle-dim = true;
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 900;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 20.0; # From 8PM
      night-light-schedule-to = 6.0;    # To 6AM
    };
    "org/gnome/desktop/session" = {
      idle-delay = 300;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/johnmper/.config/wallpapers/mountain_andy_betts.png";
      picture-uri-dark = "file:///home/johnmper/.config/wallpapers/mountain_andy_betts.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///home/johnmper/.config/wallpapers/mountain_andy_betts.png";
    };
  };
  home.packages = with pkgs; [
    # Some configuration needs
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })

    # Tools
    unzip
    fzf
    curl
    moreutils
    buildah
    podman
    nix-melt
    du-dust
    ripgrep
    nixpkgs-fmt
    # Neovim and related packages
    neovim
    nodejs
    xsel # clipboard tool for neovim
    # # Build system
    bazel
    bazel-buildtools
    # Local clustering
    kind
    kubernetes-helm
    # For Rust
    rustc
    cargo
    # For Cpp
    llvmPackages_11.clang
    cmake
    # For python3
    (
        python310.withPackages
        (ps:
        with ps; [
            click
            sh
            pydantic
        ])
    )
  ];
  home.file."./.config/nvim/" = {
    source = ../../dotfiles/nvim;
    recursive = true;
  };
  home.file."./.config/wallpapers/" = {
    source = ../../dotfiles/wallpapers;
    recursive = true;
  };
  systemd.user.startServices = "sd-switch"; # Reload services on switch
}
