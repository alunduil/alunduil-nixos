{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
    ./simple-mail.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;

  networking.hostName = "sherlock.alunduil.com";
  time.timeZone = "America/Chicago";
}
