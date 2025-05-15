{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

