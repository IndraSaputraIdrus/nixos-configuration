{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake";
    };
  };
}
