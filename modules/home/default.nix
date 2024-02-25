{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home = {
    username = "koehn";
    homeDirectory = "/home/koehn";
    stateVersion = "23.11";
  };

  imports = [ 
    ./programs/code.nix 
    ./programs/firefox.nix 
    ../environments/default.nix 
    ../hardware.nix 
    ];

  programs = {
    git = {
      enable = true;
      userName = "chaeyeonswav";
      userEmail = "koehn40308@gmail.com";
    };

    home-manager.enable = true;
    gh.enable = true;
    fish.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableNushellIntegration = false;
      options = [ "--cmd cd" ];
    };
  };
}
