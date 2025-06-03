{ config, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Ubuntu Mono" ];
      sansSerif = [ "Ubuntu" ];
      serif = [ "Ubuntu" ];
    };
  };
}
