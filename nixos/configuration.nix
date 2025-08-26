{ config, pkgs, ... }:

let stPatched = import ./modules/st/default.nix { inherit pkgs; };
in {
  imports = [
    ./hardware-configuration.nix
    ./modules/network.nix
    ./modules/xserver.nix
    ./modules/pulseaudio.nix
    ./modules/browser.nix
    ./modules/bspwm.nix
    ./modules/bash.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    kitty
    ntfs3g
    nodejs_24
    neovim
    lua5_1
    luarocks
    gcc
    unzip
    stPatched
  ];

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Makassar";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.nixdrz = {
    isNormalUser = true;
    description = "nix-drz";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Zram
  services.udisks2.enable = false;
  services.gvfs.enable = false;
  services.tumbler.enable = false;
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  # Variable
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
