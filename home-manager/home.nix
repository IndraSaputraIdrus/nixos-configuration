{ config, pkgs, ... }:

{
  home.username = "nixdrz";
  home.homeDirectory = "/home/nixdrz";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    btop
    fastfetch
    tree
    bat
    xdg-user-dirs
    yazi
    lazygit
    ripgrep
    xfce.thunar
    tmux
    wget
    curl
    procps
    harfbuzz # untuk font ligature di st terminal
  ];
  home.sessionVariables = {

    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Modules
  imports = [
    ./modules/bash.nix
    ./modules/fonts.nix
    ./modules/urxvt.nix
    ./modules/python.nix
    ./modules/postgresql.nix
    ./modules/st/default.nix
    ./modules/bun-baseline.nix
  ];
}
