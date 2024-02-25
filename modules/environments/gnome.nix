{ config, pkgs, ... }:

{
  services.xserver = {
    displayManager = {
     gdm = {
       enable = true;
       wayland = false;
     };
    };
    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}