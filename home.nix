{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home = {
    username = "koehn";
    homeDirectory = "/home/koehn";
    stateVersion = "23.11";
  };

  programs = {
    git = {
      enable = true;
      userName = "koehnnnn";
      userEmail = "koehn40308@gmail.com";
    };

    nushell.enable = true;
    home-manager.enable = true;
    gh.enable = true;

    firefox = {
      enable = true;

    };

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        pkief.material-icon-theme
        eamodio.gitlens
        github.copilot
      ];
      userSettings = {
        nix = {
          enableLanguageSever = true;
          serverPath = "nil";
        };

        workbench.iconTheme = "material-icon-theme";

        git = {
          confirmSync = false;
          autofetch = true;
        };
      };
    };
  };
}