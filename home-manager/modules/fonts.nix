{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # fira-code
    # fira-code-symbols

    ubuntu_font_family
    fira-code
    iosevka
    jetbrains-mono
    hack-font
    victor-mono
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Ubuntu Mono" ];
      sansSerif = [ "Ubuntu" ];
      serif = [ "Ubuntu" ];
    };
  };
}
