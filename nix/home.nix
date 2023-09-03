{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "johnmper";
  home.homeDirectory = "/home/johnmper";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Tools
    pkgs.unzip
    pkgs.fzf
    pkgs.jq
    pkgs.curl
    pkgs.moreutils
    pkgs.buildah
    pkgs.podman
    pkgs.nix-melt
    pkgs.tmux
    # # Build system
    pkgs.bazel
    pkgs.bazel-buildtools
    # Local clustering
    pkgs.kind
    pkgs.kubernetes-helm
    # For Rust
    pkgs.rustc
    pkgs.cargo
    # For Cpp
    pkgs.llvmPackages_11.clang
    pkgs.cmake
    # For python3
    (
        pkgs.python310.withPackages
        (ps:
        with ps; [
            click
            sh
            pydantic
        ])
    )
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/johnmper/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Johnmper";
    userEmail = "joaomgper94@gmail.com";
    difftastic = {
      enable = true;
      display = "side-by-side-show-both";
    };
  };
  programs.git-cliff.enable = true;
  programs.vscode = {
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
    ];

    userSettings = {
      "window.commandCenter"= true;
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
}
