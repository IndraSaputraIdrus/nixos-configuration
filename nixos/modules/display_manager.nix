{ config, pkgs, ... }:

{
  services = {
    displayManager = { ly.enable = true; };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = with pkgs; [ xterm ];
    };
  };
}

