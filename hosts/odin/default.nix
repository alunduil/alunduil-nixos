{ config, pkgs, ... }:
{
  imports = [
    ../../profiles/laptop
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "odin";
  };

  services.xserver.dpi = 192;

  time.timeZone = "America/Los_Angeles";
}
