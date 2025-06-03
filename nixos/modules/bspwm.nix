{ config, pkgs, ... }:

{
  # Window Manager
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    fastfetch
    bspwm
    sxhkd
    polybar
    rofi
    xclip
  ];
}
