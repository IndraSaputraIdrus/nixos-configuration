{ pkgs, unstable-pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		git
		htop
		bspwm
		sxhkd
		polybar
		rofi
		kitty
		neofetch
		chromium
		ntfs3g
    unzip
		nodejs_23
    xclip


    # Unstable packages
		unstable-pkgs.neovim
	];
}
