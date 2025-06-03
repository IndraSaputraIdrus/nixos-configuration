{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))

    rofi-wayland
    wl-clipboard
    hyprpaper
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  hardware = { opengl.enable = true; };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Enable wayland untuk Qt apps
    GDK_BACKEND = "wayland,x11"; # Prioritize Wayland untuk GTK
    CLUTTER_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1"; # Fix cursor issues di GPU lawas
  };
}
