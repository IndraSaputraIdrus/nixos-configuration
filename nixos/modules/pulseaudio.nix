{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = false;
    audio.enable = false;
  };

  services.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  environment.systemPackages = with pkgs; [ pulseaudio pavucontrol ];

  nixpkgs.config.pulseaudio = true;
}
