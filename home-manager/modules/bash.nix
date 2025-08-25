{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake";
      cdproject = "cd $HOME/Documents/projects";
      config = "git --git-dir=$HOME/dotfiles/ --work-tree=$HOME";
      lzconfig = "GIT_DIR=$HOME/dotfiles GIT_WORK_TREE=$HOME lazygit";
    };

    initExtra = ''
      export PS1='\n\[\e[38;5;35m\]\w\[\e[0m\] \\$ '
    '';
  };
}
