{ config, ... }:

{
  programs.urxvt = {
    enable = true;
    fonts = [ "xft: FiraCode:size=11" ];
    extraConfig = {
      # Warna Tokyo Night (Dark)
      "background" = "#1a1b26";
      "foreground" = "#c0caf5";

      # Normal colors
      "color0" = "#15161e"; # hitam
      "color1" = "#f7768e"; # merah
      "color2" = "#9ece6a"; # hijau
      "color3" = "#e0af68"; # kuning
      "color4" = "#7aa2f7"; # biru
      "color5" = "#bb9af7"; # magenta
      "color6" = "#7dcfff"; # cyan
      "color7" = "#a9b1d6"; # putih

      # Bright colors
      "color8" = "#414868"; # bright hitam
      "color9" = "#f7768e"; # bright merah
      "color10" = "#9ece6a"; # bright hijau
      "color11" = "#e0af68"; # bright kuning
      "color12" = "#7aa2f7"; # bright biru
      "color13" = "#bb9af7"; # bright magenta
      "color14" = "#7dcfff"; # bright cyan
      "color15" = "#c0caf5"; # bright putih

      # Pengaturan tambahan
      "cursorColor" = "#c0caf5";
      "cursorColor2" = "#1a1b26";
      "underlineColor" = "#bb9af7";
      "scrollBar" = false;
      "shading" = "20"; # Transparansi (0-100)
      "depth" = "32";
      "urgentOnBell" = true;
      "perl-ext-common" = "default,keyboard-select";
    };
  };
}
