{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.falkon
    firefox-esr
    qutebrowser
    ungoogled-chromium
  ];
}
