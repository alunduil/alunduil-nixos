{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
    ./simple-mail.nix
  ];

  networking.hostName = "sherlock.alunduil.com";
  time.timeZone = "America/Chicago";

  services.smartd.devices = [
    { device = "/dev/sdc"; }
    { device = "/dev/sdd"; }
  ];
}
