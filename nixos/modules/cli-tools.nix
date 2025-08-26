{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ripgrep
    btop
    lazygit
    tree
    fastfetch
    wget
    curl
    yazi
    git
  ];
}
