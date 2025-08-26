{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    excludePackages = with pkgs; [ xterm ];
  };

  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "none+i3";
}

