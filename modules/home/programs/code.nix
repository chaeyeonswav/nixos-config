{ inputs, config, pkgs, ... }:

{ 
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      eamodio.gitlens
      github.copilot
      catppuccin.catppuccin-vsc-icons
      catppuccin.catppuccin-vsc
    ];
    userSettings = {
      nix = {
        enableLanguageSever = true;
        serverPath = "nil";
      };

      workbench = {
        iconTheme = "catppuccin-mocha";
        colorTheme = "Catppuccin Mocha";
      };

      git = {
        confirmSync = false;
        autofetch = true;
        enableSmartCommit = true;
      };

      window.titleBarStyle = "custom";
    };
  };
}