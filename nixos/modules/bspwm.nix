{ config, pkgs, ... }:

{
  # Window Manager
  services.xserver.windowManager = { bspwm.enable = true; };
  environment.systemPackages = with pkgs; [
    fastfetch
    bspwm
    sxhkd
    polybar
    rofi
    xclip
    feh
  ];
}
