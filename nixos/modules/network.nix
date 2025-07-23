{ config, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enable wireless support via wpa_supplicant

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # expose port for develop vite with "--host"
  networking.firewall.allowedTCPPorts = [ 5173 ];
}
