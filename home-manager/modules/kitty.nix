{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    font.size = 12;
    themeFile = "tokyo_night_night";
    extraConfig = ''
      window_margin_width 0 
      placement_strategy top-left 
      window_padding_width 13 
      scrollback_lines 10000
    '';
  };
}
