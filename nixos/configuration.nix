# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, system, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/bootloader.nix
    ./modules/network.nix
    ./modules/users.nix
    ./modules/nix_ld.nix
    ./modules/ram_optimization.nix
    ./modules/bspwm.nix
    ./modules/pulseaudio.nix
    # ./modules/hyprland.nix
  ];

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    kitty
    chromium
    ntfs3g
    nodejs_24
    neovim
    firefox-esr
    lua5_1
    luarocks
    gcc
    unzip
  ];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
