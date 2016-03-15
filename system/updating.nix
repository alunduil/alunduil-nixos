{ config, pkgs, ... }:

{
  imports = [];

  nix.gc.automatic = true;
  nix.useChroot = true;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-15.09-small";

  system.stateVersion = "15.09";
}
