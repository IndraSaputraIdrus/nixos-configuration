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
    fira-code
    fira-code-symbols
    ubuntu_font_family
    maim
    stow
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
  ];
}
