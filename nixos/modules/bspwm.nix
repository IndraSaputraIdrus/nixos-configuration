{ config, pkgs, ... }:

{
  # Window Manager
  services.xserver.windowManager.bspwm = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ sxhkd polybar rofi xclip feh ];
}
