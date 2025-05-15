{ pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		neovim
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
	];
}
