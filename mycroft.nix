{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
    ./simple-mail.nix
  ];

  networking.hostName = "mycroft.alunduil.com";
  time.timeZone = "America/Chicago";
}
