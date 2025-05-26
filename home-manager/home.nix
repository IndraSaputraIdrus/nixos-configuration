{ config, pkgs, ... }:

{
  home.username = "nixdrz";
  home.homeDirectory = "/home/nixdrz";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    btop
    neofetch
    tree
    unzip
    bat
    xdg-user-dirs
    gcc

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # xdg.configFile = {
  #   "bspwm/bspwmrc" = { 
  #     source = "~/Documents/dotfiles/bspwm/bspwmrc"
  #     executable = true
  #   }
  #
  #   "sxhkd/sxhkdrc" = {
  #     source = "~/Documents/dotfiles/sxhkd/sxhkdrc"
  #   }
  # }

  home.sessionVariables = {
		EDITOR = "nvim";
		VISUAL = "nvim";
    CC = "gcc";
    CXX = "g++";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/#nixos";
    };
  };
}
