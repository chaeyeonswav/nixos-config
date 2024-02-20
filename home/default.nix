{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home = {
    username = "koehn";
    homeDirectory = "/home/koehn";
    stateVersion = "23.11";
  };

  imports = [ ./firefox.nix ];

  programs = {
    git = {
      enable = true;
      userName = "chaeyeonswav";
      userEmail = "koehn40308@gmail.com";
    };

    nushell.enable = true;
    home-manager.enable = true;
    gh.enable = true;
  };
}