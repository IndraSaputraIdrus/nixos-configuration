{ pkgs, ... }:

{
  fonts.enableDefaultPackages = false;
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    ubuntu-sans
    # jetbrains-mono
    # fira-code
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    # nerd-fonts.symbols-only
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    serif = [ "Ubuntu" ];
    sansSerif = [ "Ubuntu" ];
    monospace = [ "JetBrainsMono Nerd Font" ];
  };
}
