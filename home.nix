{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "koehn";
  home.homeDirectory = "/home/koehn";

  programs.git = {
      enable = true;
      userName = "koehnnnn";
      userEmail = "koehn40308@gmail.com";
    };

    programs.firefox.enable = true;

    programs.nushell.enable = true;

    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        pkief.material-icon-theme
        eamodio.gitlens
        GitHub.copilot
      ];
      userSettings = {
        editor.formatOnSave = true;

        nix = {
          enableLanguageSever = true;
          serverPath = "nil";
          serverSettings = {
            nil = {
              formatting = {
                command = ["nixpkgs-fmt"]
              }
            };
          };
        };

        workbench.iconTheme = "material-icon-theme";
        git.autofetch = true;
      };
    };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}