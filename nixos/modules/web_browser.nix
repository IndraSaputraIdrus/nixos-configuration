{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    kdePackages.falkon
    firefox-esr
    qutebrowser
  ];
}
