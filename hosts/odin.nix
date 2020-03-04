{ config, pkgs, ... }:
{
  imports = [
    ../profiles/laptop
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "odin";
  };

  services.postfix.hostname = pkgs.lib.mkForce "odin.laptops.alunduil.com";
  system.stateVersion = "19.03";

  time.timeZone = "America/Los_Angeles";
}
