{ config, pkgs, ... }:

{
  home.username = "nixdrz";
  home.homeDirectory = "/home/nixdrz";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    btop
    neofetch
    tree
    bat
    xdg-user-dirs
    maim
    stow
    feh
    yazi
    lazygit
    ripgrep
    xfce.thunar
    tmux
    wget
    harfbuzz # untuk font ligature di st terminal
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    CC = "gcc";
    CXX = "g++";
    PATH = "$PATH:$HOME/.bun/bin";
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
    ./modules/st.nix
  ];
}
