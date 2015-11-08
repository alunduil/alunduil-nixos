{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
      ./daneel.nix
    ];
}
