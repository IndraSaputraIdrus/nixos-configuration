{ config, ... }:

{
  # optimasi ram
  services.udisks2.enable = false;
  services.gvfs.enable = false;
  services.tumbler.enable = false;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;
}
