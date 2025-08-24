{ config, pkgs, ... }:

let
  stDesktopContent = ''
    [Desktop Entry]
    Encoding=UTF-8
    Version=1.0
    Type=Application
    Terminal=false
    Name=ST Terminal
    Exec=${pkgs.st}/bin/st
    Icon=utilities-terminal
  '';
in {
  home.packages = with pkgs; [ st ];

  home.file = {
    ".local/share/applications/st.desktop".source =
      pkgs.writeText "st-desktop" stDesktopContent;
  };
}
