{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake";
      cdproject = "cd $HOME/Documents/projects";
    };

    initExtra = ''
      export PS1='\n\[\e[38;5;35m\]\w\[\e[0m\] \\$ '
    '';
  };
}
