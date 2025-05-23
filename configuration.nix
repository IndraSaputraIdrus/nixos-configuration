# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, system, config, pkgs, ... }:
let 
  unstable-pkgs = inputs.nixpkgs-unstable.legacyPackages.${system};
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run: $ nix search wget
	environment.systemPackages = with pkgs; [
		git
		bspwm
		sxhkd
		polybar
		rofi
		kitty
		chromium
		ntfs3g
		nodejs_23
    xclip


    # Unstable packages
		unstable-pkgs.neovim
	];

  # Home manage
  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      nixdrz = import ./home.nix;
    };
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Window Manager
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.nixdrz = {
		isNormalUser = true;
		description = "nix-drz";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enable wireless support via wpa_supplicant

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


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
  system.stateVersion = "24.11"; # Did you read the comment?

}
