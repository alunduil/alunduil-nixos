{ config, pkgs, ... }:
{
  imports = [
    ../../profiles/laptop
    ./fingerprint.nix
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "odin";
  };

  services.xserver.dpi = 192;

  time.timeZone = "America/Los_Angeles";
}
