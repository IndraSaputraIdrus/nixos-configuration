{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake";
    };

    initExtra = ''
      export PS1='\n\[\e[38;5;202;7m\] \[\e[38;5;202m\][\[\e[38;5;202;1;3m\]\u\[\e[0;7;38;5;202m\]:\[\e[38;5;202m\]\w\[\e[38;5;202m\]]\[\e[0;48;5;202m\] \[\e[0m\] \[\e[38;5;40m\]-\[\e[38;5;40m\]>\[\e[0m\] \\$ '
    '';
  };
}
