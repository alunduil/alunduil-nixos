{ config, pkgs, ... }:
{
  imports = [
    ../../profiles/laptop
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "elijah";
  };

  time.timeZone = "America/Los_Angeles";
}
