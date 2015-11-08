{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
  ];

  networking.hostName = "daneel";

  services.postfix.enable = true;

  time.timeZone = "America/Chicago";
}
