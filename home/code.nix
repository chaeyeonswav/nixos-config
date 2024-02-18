{ config, pkgs, ... }:

{ 
  programs.vscode = {
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
        enableSmartCommit = true;
      };
    };
  };
}