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

    firefox.enable = true;
    nushell.enable = true;
    home-manager.enable = true;

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        pkief.material-icon-theme
        eamodio.gitlens
        github.copilot
      ];
      userSettings = {
        editor.formatOnSave = true;

        nix = {
          enableLanguageSever = true;
          serverPath = "nil";
          serverSettings = {
            nil = {
              formatting = {
                command = ["nixpkgs-fmt"];
              };
            };
          };
        };

        workbench.iconTheme = "material-icon-theme";
        git.autofetch = true;
      };
    };
  };
}