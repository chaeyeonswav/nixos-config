{ config, pkgs, ... }:

{
  imports = [ ./gnome.nix ];
  
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };
}