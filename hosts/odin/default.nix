{ config, pkgs, ... }:
{
  imports = [
    ../../profiles/laptop
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "odin";
  };

  i18n.consoleFont = "latarcyrheb-sun32";

  services.xserver.dpi = 192;

  time.timeZone = "America/Los_Angeles";
}
