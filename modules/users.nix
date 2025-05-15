{ config, pkgs, ... }:

{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.nixdrz = {
		isNormalUser = true;
		description = "nix-drz";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
	};
}

