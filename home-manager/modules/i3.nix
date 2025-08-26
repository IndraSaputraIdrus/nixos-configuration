{ config, pkgs, ... }:

{

  home.packages = with pkgs; [ dmenu feh i3status ];
  xsession.windowManager.i3 = { enable = true; };
}
