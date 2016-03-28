{ config, pkgs, ... }:

{
  imports = [];

  nix.gc.automatic = true;
  nix.useChroot = true;

  system.autoUpgrade.enable = true;
}
